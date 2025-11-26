package com.github.sharework_taskplanner.taskplanner.testing.planning.mosaic.learning;

import com.github.sharework_taskplanner.taskplanner.ShareworkPlanner;
import com.github.sharework_taskplanner.taskplanner.dom.mosaic.MosaicModelGenerator;
import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.PlannerBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.PlanDataBaseBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.ex.NoSolutionFoundException;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.ex.ProblemInitializationException;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.plan.SolutionPlan;

/**
 * 
 * @author anacleto
 *
 */
public class MosaicHeuristicLearning 
{
	private static final int MAX_RUN = 50;
	
	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) 
	{ 
		try
		{
			// model generator
			MosaicModelGenerator gen = new MosaicModelGenerator();
			// generate DDL and PDL
			String[] model = gen.generate();
			
			
			// run counter
			int counter = 1; 
			while (counter <= MAX_RUN)
			{
				try 
				{
					// set the learning flag to "1" in the file deliberative.properties
					System.out.println("Starting heuristic learning run #" + counter + "\n");
					// build the plan database
					PlanDataBase pdb = PlanDataBaseBuilder.createAndSet(
							model[0], model[1]);
					
					// set a planning instance of the plan database
					Planner planner = PlannerBuilder.createAndSet(
							ShareworkPlanner.class,
							pdb);
		
					// start planning
					SolutionPlan plan = planner.plan();
					// solution found
					System.out.println("----------------------------------\n"
							+ "Solution found after " + plan.getSolvingTime() + " msecs\n"
							+ "Solution plan:\n"
							+ "" + plan + "\n"
							+ "----------------------------------\n");
					
					// call garbage collector
					System.gc();
					Thread.sleep(1000);
				}
				catch (NoSolutionFoundException ex) {
					// no solution found
					System.err.println(ex.getMessage());
				}
				catch (ProblemInitializationException ex) {
					System.err.println(ex.getMessage());
					ex.printStackTrace(System.err);
				}
				catch (Exception ex) {
					System.err.println(ex.getMessage());
					ex.printStackTrace(System.err);
				}
				
				// increment run counter 
				counter++;
			}
		}
		catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
	}
}
