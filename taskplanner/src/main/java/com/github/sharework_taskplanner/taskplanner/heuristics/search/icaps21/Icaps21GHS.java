package com.github.sharework_taskplanner.taskplanner.heuristics.search.icaps21;

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
public class Icaps21GHS extends SearchStrategy
{
	private MongoClient heuristicDataset;
	
	/**
	 * 
	 */
	protected Icaps21GHS() {
		super("GreedyHeursiticSearchStrategy");
		// setup connection with (local) heuristic DB
		this.heuristicDataset = MongoClients.create();
	}
	
	/**
	 * 
	 */
	@PostConstruct
	protected void init() {
		super.init();
		
		PlanRisk.pgraph = this.pgraph;
		PlanRisk.robot = this.pdb.getComponentByName("Robot");
		PlanRisk.human = this.pdb.getComponentByName("Human");
	}
	
	/**
	 * 
	 * @param node
	 */
	protected void registerSearchChoice(SearchSpaceNode node) 
	{
		// check db collection
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
			PlanRisk syn = (PlanRisk) node.getDomainSpecificMetric();
			
			// synergy 
			doc.append("node-plan-synergy", syn.getPlanRisk());
			doc.append("node-heuristic-plan-synergy", syn.getHeuristicRisk());
			
			
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
		PlanRisk risk = (PlanRisk) node.getDomainSpecificMetric();

		// set debug information
		debug("Current plan { "
				+ "\"plan-makespan\": [" + node.getPlanMakespan()[0]  + ", " + node.getPlanMakespan()[1] + "], "
				+ "\"heuristic-makespan\" [" + node.getPlanHeuristicMakespan()[0] + ", " + node.getPlanHeuristicMakespan()[1] + "], "
				+ "\"plan-cost\": " + node.getPlanCost() + ", "
				+ "\"heuristic-cost\": [" + node.getPlanHeuristicCost()[0] + ", " + node.getPlanHeuristicCost()[1] + "], "
				+ "\"plan-synergy\": " + risk.getPlanRisk() + ", "
				+ "\"heuristic-synergy\": " + risk.getHeuristicRisk() + ", "
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
		PlanRisk pSyn = new PlanRisk(node, this.getDataset());
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
	public int compare(SearchSpaceNode o1, SearchSpaceNode o2) {
		// check heuristic cost only 
		return o1.getPlanHeuristicCost()[0] < o2.getPlanHeuristicCost()[0] ? -1 : o1.getPlanHeuristicCost()[0] > o2.getPlanHeuristicCost()[0] ? 1 : 0; 
	}
	
	/**
	 * 
	 * @return
	 */
	private MongoCollection<Document> getDataset() 
	{
		// get data-base
		MongoDatabase db = this.heuristicDataset.getDatabase("roxanne_icaps21");
		// select data-set
		MongoCollection<Document> collection = db.getCollection("hrc_risk_dynamics");
		// return collection
		return collection;
	}

}


