package com.github.sharework_taskplanner.taskplanner.testing.planning.icaps21;

import java.util.Arrays;

import com.github.sharework_taskplanner.taskplanner.heuristics.search.icaps21.PlanRisk;
import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.PlannerBuilder;
import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.framework.domain.PlanDataBaseBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.plan.SolutionPlan;

/**
 *
 */
public class ICAPS21ExperimentLauncher 
{
	private static final String OUTPUT_FOLDER = "domains/icaps21";
	private static int HORIZON = 100000;

	private static int[] ROWS = new int[] {
			2, 3, 4, 5, 6, 7, 8, 9, 10
	};
	
	private static int[] COLUMNS = new int[] {
			2, 3, 4, 5, 6, 7, 8, 9, 10
	};

	// percentage of distribution of tasks between Blue, White and Orange tasks
	private static double[][] BWO = new double [][] {
			{.8, .1, .1},		// almost all shared tasks to be considered
			//{.6, .2, .2},
			//{.4, .3, .3},
			//{.2, .4, .4}
	};
	
	private static Class<?>[] PLANNERS = new Class<?>[] {
		MHSPlanner.class,
		RHSPlanner.class,
		THSPlanner.class,
		GHSPlanner.class,
		AHSPlanner.class,
		MBSPlanner.class,
		DBSPlanner.class
	};
	
	
	// common uncertainty about task execution
	private static final int DURATION_UNCERTAINTY = 5;
	
	// robot tasks - duration bounds
	private static final int ROBOT_MAX_DURATION = 23;
	
	// human tasks - duration bounds
	private static final int HUMAN_MAX_DURATION = 42;
	
	// risk max
	private static final double RISK_MAX = 50.0;
	
	
	/**
	 * 
	 */
	protected ICAPS21ExperimentLauncher() {}
	
	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) 
	{
		// create a collection to the DB
		MongoClient client = new MongoClient();
		try
		{
			// get db 	
			MongoDatabase db = client.getDatabase("roxanne_icaps21");
			// get collection
			MongoCollection<Document> collection = db.getCollection("experiments");
			// remove all data from the collection
			collection.drop();
			
			// generate model 
			ICAPS21ModelGenerator modelGen = new ICAPS21ModelGenerator(
					OUTPUT_FOLDER, 
					DURATION_UNCERTAINTY, 
					ROBOT_MAX_DURATION, 
					HUMAN_MAX_DURATION);
			
			// experiment counter
			int expConfig = 0;
			// set planner
			for (Class<?> pClass : PLANNERS)
			{
				// set run configurations
				for (int row : ROWS) 
				{
					for (int column : COLUMNS) 
					{
						// generate risk dataset  
						ICAPS21RiskDatasetGenerator riskGen = new ICAPS21RiskDatasetGenerator(
								"roxanne_icaps21", 
								"hrc_risk_dynamics", 
								row, 
								column, 
								RISK_MAX);
						
						// getnerate risk dataset
						riskGen.generate();
						
						for (double[] bwo : BWO)
						{
							// set data
							double planningTime = 0;
							double planCost = 0;
							double planRisk = 0;
							double planMakespan = 0;
							double robotMakespan = 0;
							double humanMakespan = 0;
							
							int run = 0;
							for (int i = 0; i < 1; i++)
							{
								try
								{
									
									System.out.println("Launching: {"
											+ "\"planner\": \"" + pClass.getSimpleName().replace("Planner", "") + "\", "
											+ "\"#row\": " + row + ", "
											+ "\"#column\": " + column + ", "
											+ "\"bwo\": " + Arrays.toString(bwo) + ", "
										+ "}");
									
									// generate planning model
									String[] paths = modelGen.generate(row, column, bwo, HORIZON);
									
									
									// build the plan database
									PlanDataBase pdb = PlanDataBaseBuilder.createAndSet(
											paths[0], paths[1]);
									
									// set a planning instance of the plan database
									Planner planner = PlannerBuilder.createAndSet(
											(Class<? extends Planner>) pClass, pdb);

									// start planning
									SolutionPlan plan = planner.plan();

									// get solution node 
									SearchSpaceNode solution = planner.getCurrentNode();
									
									PlanRisk risk = (PlanRisk) solution.getDomainSpecificMetric();
									
									// get general makespan
									double[] mk = plan.getMakespan();
									// get robot makespan
									double[] rmk = plan.getMakespan("Robot");
									// get human makespan
									double[] hmk = plan.getMakespan("Human");
									
									// print info about solution
									System.out.println("Solution: {"
											+ "\"planning-time\": " + plan.getSolvingTime() + ", "
											+ "\"cost\": " + solution.getPlanCost() + ", "
											+ "\"makespan-plan\": [" + mk[0] + ", " + mk[1] + "], "
											+ "\"makespan-robot\": [" + rmk[0] + ", " + rmk[1] + "], "
											+ "\"makespan-human\": [" + hmk[0] + ", " + hmk[1] + "], "
											+ "\"risk\": " + risk.getPlanRisk() + ", "
											+ "}");

									// update parameters
									planningTime += plan.getSolvingTime(); 
									planCost += solution.getPlanCost();
									planRisk += risk.getPlanRisk();
									planMakespan += mk[0];
									robotMakespan += rmk[0];
									humanMakespan += hmk[0];
									
									// increment runs
									run++;
								}
								catch (Exception ex) {
									// no solution found
									System.out.println("\nNo solution found: " + ex.getMessage() + "\n");
								}
								finally 
								{
									// clean some memory
									System.gc();
									// wait a bit befor launching the next
									Thread.sleep(1000);
								}
							}
							
							
							// register data
							Document doc = new Document("experiment", expConfig);
							// set planning configuration
							doc.append("planner", pClass.getSimpleName().replace("Planner", ""));
							doc.append("#row", row);
							doc.append("#column", column);
							doc.append("bwo", Arrays.toString(bwo));

							// set configuration results
							doc.append("planning-time", (planningTime / run));
							doc.append("cost", (planCost / run));
							doc.append("risk", (planRisk / run));
							doc.append("makespan-plan", (planMakespan / run));
							doc.append("makespan-robot", (robotMakespan / run));
							doc.append("makespan-human", (humanMakespan / run));
							
							// insert data into the collection
							collection.insertOne(doc);
							
						}
						
						
						// increment counter
						expConfig++;
					}
				}
			}
		}
		catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		finally {
			// close connection
			client.close();
		}
	}
}
