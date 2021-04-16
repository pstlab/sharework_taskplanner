package com.github.sharework_taskplanner.taskplanner.testing.planning.stiima.nosyn;

import com.github.sharework_taskplanner.taskplanner.dom.mosaic.MosaicModelGenerator;
import com.github.sharework_taskplanner.taskplanner.heuristics.flaws.ShareworkFlawSelectionHeuristics;
import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.PlannerBuilder;
import it.cnr.istc.pst.platinum.ai.deliberative.solver.PseudoControllabilityAwareSolver;
import it.cnr.istc.pst.platinum.ai.framework.domain.PlanDataBaseBuilder;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.PlanDataBase;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.FrameworkLoggerConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.FlawSelectionHeuristicsConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.PlannerSolverConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.SearchStrategyConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.ex.NoSolutionFoundException;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.ex.ProblemInitializationException;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.plan.SolutionPlan;
import it.cnr.istc.pst.platinum.ai.framework.utils.log.FrameworkLoggingLevel;

/**
 *
 */
@PlannerSolverConfiguration(
		solver = PseudoControllabilityAwareSolver.class,
		timeout = 300000
)
@FlawSelectionHeuristicsConfiguration(
		heuristics = ShareworkFlawSelectionHeuristics.class
)
@SearchStrategyConfiguration(
		strategy = MinDeltaMHSNoSyn.class
)
@FrameworkLoggerConfiguration(		
		level = FrameworkLoggingLevel.OFF
)
public class MinDeltaMHSNoSynPlanner extends Planner 
{
	protected MinDeltaMHSNoSynPlanner() {
		super();
	}
	
	
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
			
			
			// build the plan database
			PlanDataBase pdb = PlanDataBaseBuilder.createAndSet(
					model[0], model[1]);
			
			// set a planning instance of the plan database
			Planner planner = PlannerBuilder.createAndSet(
					MinDeltaMHSNoSynPlanner.class, pdb);

			// start planning
			SolutionPlan plan = planner.plan();
			// solution found
			System.out.println("----------------------------------\n"
					+ "Solution found after " + plan.getSolvingTime() + " msecs\n"
					+ "Solution plan:\n"
					+ "" + plan + "\n"
					+ "----------------------------------\n");
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
	}
}
