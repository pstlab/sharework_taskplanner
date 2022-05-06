package com.github.sharework_taskplanner.taskplanner.testing.planning.cybernetics;

import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.PlannerBuilder;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.GreedyDepthSearchStrategy;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.StandardDeviationMinimizationSearchStrategy;
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
@PlannerSolverConfiguration
@FlawSelectionHeuristicsConfiguration
@SearchStrategyConfiguration(
		strategy = StandardDeviationMinimizationSearchStrategy.class
		//strategy = GreedyDepthSearchStrategy.class
		//strategy = WeightedAStarSearchStrategy.class
		//strategy = ParetoMHS.class
		//strategy = MinMaxMHS.class
)
@FrameworkLoggerConfiguration(		
		level = FrameworkLoggingLevel.INFO
)
public class CyberneticsTesting extends Planner {

	protected CyberneticsTesting() {
		super();
	}

	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		try {
			
			// build the plan database
			PlanDataBase pdb = PlanDataBaseBuilder.createAndSet(
					"domains/cybernetics/hrc_mosaic_v1.0.ddl",
					"domains/cybernetics/hrc_mosaic.pdl");
			
			// set a planning instance of the plan database
			Planner planner = PlannerBuilder.createAndSet(
					CyberneticsTesting.class,
					pdb);

			// start planning
			SolutionPlan plan = planner.plan();
			// solution found
			System.out.println("----------------------------------\n"
					+ "Solution found after " + plan.getSolvingTime() + " msecs\n"
					+ "Solution plan:\n"
					+ "" + plan + "\n"
					+ "----------------------------------\n");

			planner.display();

		} catch (NoSolutionFoundException ex) {
			// no solution found
			System.err.println(ex.getMessage());
		} catch (ProblemInitializationException ex) {
			System.err.println(ex.getMessage());
			ex.printStackTrace(System.err);
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
			ex.printStackTrace(System.err);
		}
	}
}
