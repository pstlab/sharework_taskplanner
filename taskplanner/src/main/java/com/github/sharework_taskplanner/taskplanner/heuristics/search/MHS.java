package com.github.sharework_taskplanner.taskplanner.heuristics.search;

import java.util.Map;

import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.SearchStrategy;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.ex.EmptyFringeException;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.lifecycle.PostConstruct;

/**
 * 
 * @author alessandroumbrico
 *
 */
public class MHS extends SearchStrategy 
{
	private static final double SYN_MAX = 50.0;
	private MongoClient heuristicDataset;

	/**
	 * 
	 */
	protected MHS() {
		super("MultiobjectiveHeuristicSearchStrategy");
		// setup connection with (local) heuristic DB
		this.heuristicDataset = MongoClients.create();
	}
	
	/**
	 * 
	 */
	@PostConstruct
	protected void init() {
		super.init();
		
		// set static field of plan synergy
		PlanSynergy.SYN_MAX = SYN_MAX;
		PlanSynergy.pgraph = this.pgraph;
		PlanSynergy.robot = this.pdb.getComponentByName("Robot");
		PlanSynergy.human = this.pdb.getComponentByName("Human");
	}
	
	/**
	 * 
	 * @param node
	 */
	protected void registerSearchChoice(SearchSpaceNode node) 
	{
		// check DB collection
		if (this.collection != null) 
		{
			
			
			// create solving statistic record
			Document doc = new Document("step", node.getId());
			doc.append("fringe-size", this.fringe.size());
			doc.append("node-number-of-flaws", node.getNumberOfFlaws());
			doc.append("node-depth", node.getDepth());
			
			// consolidated values of metrics
			doc.append("node-plan-cost", node.getPlanCost());
			doc.append("node-plan-makespan-min", node.getPlanMakespan()[0]);
			doc.append("node-plan-makespan-max", node.getPlanMakespan()[1]);
			
			// heuristic estimation of metrics
			doc.append("node-heuristic-plan-cost-min", node.getPlanHeuristicCost()[0]);
			doc.append("node-heuristic-plan-cost-max", node.getPlanHeuristicCost()[1]);
			doc.append("node-heuristic-plan-makespan-min", node.getPlanHeuristicMakespan()[0]);
			doc.append("node-heuristic-plan-makespan-max", node.getPlanHeuristicMakespan()[1]);
			
			
			// get synergy information
			PlanSynergy syn = (PlanSynergy) node.getDomainSpecificMetric();
			
			// synergy 
			doc.append("node-plan-synergy", syn.getPlanSynergy());
			doc.append("node-heuristic-plan-synergy", syn.getHeuristicSynergy());
			
			
			// get robot component 
			DomainComponent robot = this.pdb.getComponentByName("Robot");
			// get human component
			DomainComponent human = this.pdb.getComponentByName("Human");
			
			// check robot  and human makespan
			Double[] rmk = new Double[] {0.0, 0.0};
			if (node.getMakespan().containsKey(robot)) {
				rmk = node.getMakespan().get(robot);
			}
			
			Double[] hmk = new Double[] {0.0, 0.0};
			if (node.getMakespan().containsKey(human)) {
				hmk = node.getMakespan().get(human);
			}
			
			// R-H makespan
			doc.append("node-plan-makespan-robot", rmk[0]);
			doc.append("node-plan-makespan-human", hmk[0]);
			
			// insert data into the collection
			this.collection.insertOne(doc);
		}
	}
	
	/**
	 * 
	 */
	public SearchSpaceNode dequeue() 
			throws EmptyFringeException 
	{
		// extract a node from the fringe
		SearchSpaceNode node = super.dequeue();
		// get risk
		PlanSynergy risk = (PlanSynergy) node.getDomainSpecificMetric();
		
		// check node information
		System.out.println("Current plan { "
				+ "\"plan-makespan\": [" + node.getPlanMakespan()[0]  + ", " + node.getPlanMakespan()[1] + "], "
				+ "\"heuristic-makespan\" [" + node.getPlanHeuristicMakespan()[0] + ", " + node.getPlanHeuristicMakespan()[1] + "], "
				+ "\"plan-cost\": " + node.getPlanCost() + ", "
				+ "\"heuristic-cost\": [" + node.getPlanHeuristicCost()[0] + ", " + node.getPlanHeuristicCost()[1] + "], "
				+ "\"plan-synergy\": " + risk.getPlanSynergy() + ", "
				+ "\"heuristic-synergy\": " + risk.getHeuristicSynergy() + ", "
				+ "}");
		
		// set debug information
		debug("Current plan { "
				+ "\"plan-makespan\": [" + node.getPlanMakespan()[0]  + ", " + node.getPlanMakespan()[1] + "], "
				+ "\"heuristic-makespan\" [" + node.getPlanHeuristicMakespan()[0] + ", " + node.getPlanHeuristicMakespan()[1] + "], "
				+ "\"plan-cost\": " + node.getPlanCost() + ", "
				+ "\"heuristic-cost\": [" + node.getPlanHeuristicCost()[0] + ", " + node.getPlanHeuristicCost()[1] + "], "
				+ "\"plan-synergy\": " + risk.getPlanSynergy() + ", "
				+ "\"heuristic-synergy\": " + risk.getHeuristicSynergy() + ", "
				+ "}");
		// get node
		return node;
	}
	
	/**
	 * 
	 */
	@Override
	public void enqueue(SearchSpaceNode node) 
	{
		// compute heuristic cost
		Map<DomainComponent, Double[]> hc = this.computeHeuristicCost(node);
		// set planning distance as heuristics
		node.setHeuristicCost(hc);
		
		// compute heuristic makespan 
		Map<DomainComponent, Double[]> hm = this.computeHeuristicMakespan(node);
		// set heuristic
		node.setHeuristicMakespan(hm);
		
		// create plan synergy
		PlanSynergy pSyn = new PlanSynergy(node, this.getDataset());
		// set additional metric
		node.setDomainSpecificMetric(pSyn);

		// add the node to the priority queue
		this.fringe.offer(node);
	}
	
	/**
	 * 
	 */
	@Override
	public void clear() {
		// close DB client 
		this.heuristicDataset.close();
		// finalize clear
		super.clear();
	}
	
	/**
	 * 
	 */
	@Override
	public int compare(SearchSpaceNode o1, SearchSpaceNode o2) 
	{
		// get costs as the sum of actual cost and heuristic estimation (a* like)
		double c1 = o1.getPlanCost() + o1.getPlanHeuristicCost()[0];
		double c2 = o2.getPlanCost() + o2.getPlanHeuristicCost()[0];
		
		// get makespan as the sum of actual makespan and heuristic estimation
		double m1 = o1.getPlanMakespan()[0] + o1.getPlanHeuristicMakespan()[0];
		double m2 = o2.getPlanMakespan()[0] + o2.getPlanHeuristicMakespan()[0];
		
		// get risk information
		PlanSynergy pr1 = (PlanSynergy) o1.getDomainSpecificMetric();
		PlanSynergy pr2 = (PlanSynergy) o2.getDomainSpecificMetric();
		
		// get risk as the sum of actual risk and heuristic estimation
		double r1 = pr1.getPlanSynergy() + pr1.getHeuristicSynergy();
		double r2 = pr2.getPlanSynergy() + pr2.getHeuristicSynergy();
		
		// check dominance condition between partial plans
		return m1 < m2 && r1 < r2 && c1 < c2 ? -1 : m1 > m2 && r1 > r2 && c1 > c2 ? 1 :
			// check heuristic distance to solutions
			o1.getPlanHeuristicCost()[0] < o2.getPlanHeuristicCost()[0] ? -1 : o1.getPlanHeuristicCost()[0] > o2.getPlanHeuristicCost()[0] ? 1 :
				// check heuristics makespan
				m1 < m2 ? -1 : m1 > m2 ? 1 :
					// check synergy
					r1 < r2 ? -1 : r1 > r2 ? 1 :  
						// check heuristic distance to solutions
						c1 < c2 ? -1 : c1 > c2 ? 1 : 0;
				
	}
	
	/**
	 * 
	 * @return
	 */
	private MongoCollection<Document> getDataset() 
	{
		// get data-base
		MongoDatabase db = heuristicDataset.getDatabase("sharework");
		// select data-set
		MongoCollection<Document> collection = db.getCollection("hrc_task_dynamic_risks");
		// return collection
		return collection;
	}

}


