package com.github.sharework_taskplanner.taskplanner.heuristics.search;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.SearchStrategy;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.ex.EmptyFringeException;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.lifecycle.PostConstruct;
import it.cnr.istc.pst.platinum.ai.framework.utils.properties.FilePropertyReader;

/**
 * 
 * @author alessandroumbrico
 *
 */
public class LearningMHS extends SearchStrategy 
{
	private static final double SYN_MAX = 50.0;
	
	// learning flag
	boolean learning;
	
	// data of last extract node
	private double makespan;
	private double risk;
	private double cost;
	private int depth;
	private int fsize;

	private double[] learnedMakespan;				// min and max makespsan learned
	private double[] learnedRisk;					// min and max risk learned
	private double[] learnedCost;					// min and max learned cost
	
	private List<SearchSpaceNode> pruned;			// list of pruned nodes
	
	
	private MongoClient lClient;					// client connecting to the learning DB
	
	/**
	 * 
	 */
	protected LearningMHS() {
		super("MultiobjectiveHeuristicLearningSearchStrategy");
		// set default learning flag
		this.learning = true;
		this.lClient = null;
	}
	
	/**
	 * 
	 */
	@PostConstruct
	public void init()
	{
		super.init();
		
		// set static field of plan synergy
		PlanSynergy.SYN_MAX = SYN_MAX;
		PlanSynergy.pgraph = this.pgraph;
		PlanSynergy.robot = this.pdb.getComponentByName("Robot");
		PlanSynergy.human = this.pdb.getComponentByName("Human");
		
		
		// get deliberative properties
		FilePropertyReader properties = new FilePropertyReader(
				FRAMEWORK_HOME + FilePropertyReader.DEFAULT_DELIBERATIVE_PROPERTY);
		
		System.out.println(">>> Reading config. file " + FRAMEWORK_HOME + FilePropertyReader.DEFAULT_DELIBERATIVE_PROPERTY + "\n");
		// set learning flag
		this.learning = properties.getProperty("learning").trim().equals("1");
		// check learning flag
		if (!this.learning) 
		{
			// initialize list of pruned nodes
			this.pruned = new ArrayList<>();
			
			// set learning parameters
			this.learnedCost = new double[] {
					Double.MAX_VALUE - 1,
					Double.MIN_VALUE + 1
			};
			
			this.learnedMakespan = new double[] {
					Double.MAX_VALUE - 1,
					Double.MIN_VALUE + 1
			};
			
			this.learnedRisk = new double[] {
					Double.MAX_VALUE - 1,
					Double.MIN_VALUE + 1
			};
			
			
			// get learning dataset
			MongoCollection<Document> collection = this.getLearningDataset();
			// set the most optimistic value for each parameter of the solutions
			try (MongoCursor<Document> it = collection.find().iterator()) 
			{
				// check dataset
				while (it.hasNext())
				{
					// get next document
					Document doc = it.next();
					try
					{
						// update min learned makespan
						this.learnedMakespan[0] = Math.min(this.learnedMakespan[0],
								doc.getDouble("makespan"));
					}
					catch (Exception ex) {
						// parse as int 
						this.learnedMakespan[0] = Math.min(this.learnedMakespan[0],
								doc.getInteger("makespan"));
					}
						
					try 
					{
						// update max learned makespan
						this.learnedMakespan[1] = Math.max(this.learnedMakespan[1],
								doc.getDouble("makespan"));
					}
					catch (Exception ex) { 
						// parse as int
						this.learnedMakespan[1] = Math.max(this.learnedMakespan[1],
								doc.getInteger("makespan"));
					}
					
					try
					{
						// updarte min learned risk
						this.learnedRisk[0] = Math.min(this.learnedRisk[0],
								doc.getDouble("risk"));
					}
					catch (Exception ex) {
						// parse as int
						this.learnedRisk[0] = Math.min(this.learnedRisk[0],
								doc.getInteger("risk"));
					}
					
					try 
					{
						// update max learned risk
						this.learnedRisk[1] = Math.max(this.learnedRisk[1], 
								doc.getDouble("risk"));
					}
					catch (Exception ex) {
						// parse as int
						this.learnedRisk[1] = Math.max(this.learnedRisk[1], 
								doc.getInteger("risk"));
					}
					
					try
					{
						// update min learned cost
						this.learnedCost[0] = Math.min(this.learnedCost[0], 
								doc.getDouble("cost"));
					}
					catch (Exception ex) {
						// parse int
						this.learnedCost[0] = Math.min(this.learnedCost[0], 
								doc.getInteger("cost"));
					}
					
					try
					{
						// update maxz learned cost
						this.learnedCost[1] = Math.max(this.learnedCost[1], 
								doc.getDouble("cost"));
					}
					catch (Exception ex) {
						// parse as int
						this.learnedCost[1] = Math.max(this.learnedCost[1], 
								doc.getInteger("cost"));
						
					}
				}
			}
			
			// ready to start specialized strategy
			System.out.println("Learned search parameteres of heuristics:\n"
					+ "- best values { \"risk\": " + this.learnedRisk[0] + ", \"makespan\": " + this.learnedMakespan[0] + ", \"cost\": " + this.learnedCost[0] + " }\n"
					+ "- worst values { \"risk\": " + this.learnedRisk[1] + ", \"makespan\": " + this.learnedMakespan[1] + ", \"cost\": " + this.learnedCost[1] + " }\n");
			
			info("Learned search parameteres of heuristics:\n"
					+ "- best values { \"risk\": " + this.learnedRisk[0] + ", \"makespan\": " + this.learnedMakespan[0] + ", \"cost\": " + this.learnedCost[0] + " }\n"
					+ "- worst values { \"risk\": " + this.learnedRisk[1] + ", \"makespan\": " + this.learnedMakespan[1] + ", \"cost\": " + this.learnedCost[1] + " }\n");
		}
	}

	/**
	 * 
	 */
	@Override
	public SearchSpaceNode dequeue() 
			throws EmptyFringeException 
	{
		// extract a node from the fringe
		SearchSpaceNode node = super.dequeue();
		// get synergy
		PlanSynergy pSyn = (PlanSynergy) node.getDomainSpecificMetric();
		
		// check learning flag
		if (this.learning) 
		{
			// update makespan
			this.makespan = node.getPlanMakespan()[0];
			// update risk 
			this.risk = pSyn.getPlanSynergy();
			// update cost 
			this.cost = node.getPlanCost();
			// update depth
			this.depth = node.getDepth();
			// update fringe size
			this.fsize = this.fringe.size();
		}
		else {
			// check node information
			System.out.println("Current plan { "
					+ "\"plan-makespan\": [" + node.getPlanMakespan()[0]  + ", " + node.getPlanMakespan()[1] + "], "
					+ "\"heuristic-makespan\" [" + node.getPlanHeuristicMakespan()[0] + ", " + node.getPlanHeuristicMakespan()[1] + "], "
					+ "\"plan-cost\": " + node.getPlanCost() + ", "
					+ "\"heuristic-cost\": [" + node.getPlanHeuristicCost()[0] + ", " + node.getPlanHeuristicCost()[1] + "], "
					+ "\"plan-synergy\": " + pSyn.getPlanSynergy() + ", "
					+ "\"heuristic-synergy\": " + pSyn.getHeuristicSynergy()+ " "
					+ "}"); 
		}

		// set debug information
		debug("Current plan { "
				+ "\"plan-makespan\": [" + node.getPlanMakespan()[0]  + ", " + node.getPlanMakespan()[1] + "], "
				+ "\"heuristic-makespan\" [" + node.getPlanHeuristicMakespan()[0] + ", " + node.getPlanHeuristicMakespan()[1] + "], "
				+ "\"plan-cost\": " + node.getPlanCost() + ", "
				+ "\"heuristic-cost\": [" + node.getPlanHeuristicCost()[0] + ", " + node.getPlanHeuristicCost()[1] + "], "
				+ "\"plan-synergy\": " + pSyn.getPlanSynergy() + ", "
				+ "\"heuristic-synergy\": " + pSyn.getHeuristicSynergy()+ " "
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
		// get planning distance
		Map<DomainComponent, Double[]> hc = this.computeHeuristicCost(node);
		// set planning distance as heuristics
		node.setHeuristicCost(hc);
		
		// get makespan estimation 
		Map<DomainComponent, Double[]> hm = this.computeHeuristicMakespan(node);
		// set heuristic
		node.setHeuristicMakespan(hm);
		
		// generate plan synergy 
		PlanSynergy pSyn = new PlanSynergy(node, this.collection);
		// set plan synergy
		node.setDomainSpecificMetric(pSyn);
		
		// check learning flag
		if (!this.learning) 
		{
			// get mean values of parameters
			double cMean = (this.learnedCost[0] + this.learnedCost[1]) / 2.0;
			double mMean = (this.learnedMakespan[0] + this.learnedMakespan[1]) / 2.0;
			double rMean = (this.learnedRisk[0] + this.learnedRisk[1]) / 2.0;
			
			// check if parameters are outised the expected range
			if (node.getPlanCost() > cMean && node.getPlanMakespan()[0] > mMean && pSyn.getPlanSynergy() > rMean)
			{
				// prune the node
				info("Pruning node because (all) parameters are outside mean (optimized) ranges:\n"
						+ "- mean ranges: { \"mean-risk\": " +  rMean + ", \"mean-makespan\": " + mMean +  ", \"mean-cost\": " + cMean + " }\n"
						+ "- node: " + node + "\n");
				// add to pruned node
				this.pruned.add(node);
			}
			else {
				// add the node to the priority queue
				this.fringe.offer(node);
			}
			
		}
		else {
		
			// add the node to the priority queue
			this.fringe.offer(node);
				
		}
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
		PlanSynergy ps1 = (PlanSynergy) o1.getDomainSpecificMetric();
		PlanSynergy ps2 = (PlanSynergy) o2.getDomainSpecificMetric();
		
		// get risk as the sum of actual risk and heuristic estimation
		double r1 = ps1.getPlanSynergy() + ps1.getHeuristicSynergy();
		double r2 = ps2.getPlanSynergy() + ps2.getHeuristicSynergy();
		
		// check learning flag
		if (this.learning) 
		{
			// check dominancy between partial plans
			return c1 < c2 && m1 < m2 && r1 < r2 ? -1 : c1 > c2 && m1 > m2 && r1 > r2 ? 1 :
				// check heuristic distance from makespan
				c1 < c2 ? -1 : c1 > c2 ? 1 :
					// check heuristic distance to solutions
					m1 < m2 ? -1 : m1 > m2 ? 1 : 0;	
		}
		else 
		{
			// check cost distance to expected values
			double dc1 = Math.abs(c1 - this.learnedCost[0]);
			double dc2 = Math.abs(c2 - this.learnedCost[0]);
			
			// check makespan distance to expected values
			double dm1 = Math.abs(m1 - this.learnedMakespan[0]);
			double dm2 = Math.abs(m2 - this.learnedMakespan[0]);
			
			// check risk distance to expected values
			double dr1 = Math.abs(r1 - this.learnedRisk[0]);
			double dr2 = Math.abs(r2 - this.learnedRisk[0]);
			
			// check distance from desired values
			return dc1 < dc2 && dm1 < dm2 && dr1 < dr2 ? -1 : dc1 > dc2 && dm1 > dm2 && dr1 > dr2 ? 1 :
				// check distance from desired cost
				dc1 < dc2 ? -1 : dc1 > dc2 ? 1 :
					// check distance from desired makespan
					dm1 < dm2 ? -1 : dm1 > dm2 ? 1 : 0;
		}
	}
	
	/**
	 * 
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
			
			// insert data into the collection
			this.collection.insertOne(doc);
		}
	}
	
	
	/**
	 * 
	 */
	@Override
	public void clear() 
	{
		// check learning flag
		if (this.learning) 
		{
			// get learning database
			MongoCollection<Document> collection = this.getLearningDataset();
			
			// create solving statistic record
			Document doc = new Document();
			doc.append("cost", this.cost);
			doc.append("depth", this.depth);
			doc.append("fsize", this.fsize);
			doc.append("makespan", this.makespan);
			doc.append("risk", this.risk);
			
			// insert data into the DB
			collection.insertOne(doc);
		}
		else {
			// print number of pruned nodes
			System.out.println("Total number of pruned nodes " + this.pruned.size() + "\n");
			info("Total number of pruned nodes " + this.pruned.size() + "\n");
		}
		
		// close connection to learning DB
		if (this.lClient != null) {
			// close connection
			this.lClient.close();
		}
		
		super.clear();
	}
	
//	/**
//	 * 
//	 * @return
//	 */
//	private MongoCollection<Document> getDataset() 
//	{
//		// check if connection should be established
//		if (client == null) {
//			// create client
//			client = MongoClients.create();
//		}
//		
//		// get data-base
//		MongoDatabase db = client.getDatabase("sharework");
//		// select data-set
//		MongoCollection<Document> collection = db.getCollection("hrc_task_dynamic_risks");
//		// return collection
//		return collection;
//	}
	
	/**
	 * 
	 * @return
	 */
	private MongoCollection<Document> getLearningDataset() 
	{
		// check if connection should be established
		if (this.lClient == null) {
			// create client
			this.lClient = MongoClients.create();
		}
		
		// get data-base
		MongoDatabase db = this.lClient.getDatabase("sharework");
		// select data-set
		MongoCollection<Document> collection = db.getCollection("hrc_mosaic_search");
		// return collection
		return collection;
	}
}



