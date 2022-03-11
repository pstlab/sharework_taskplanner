package com.github.sharework_taskplanner.taskplanner;

import com.github.sharework_taskplanner.taskplanner.heuristics.flaws.ShareworkFlawSelectionHeuristics;
import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.solver.PseudoControllabilityAwareSolver;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.FrameworkLoggerConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.FlawSelectionHeuristicsConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.PlannerSolverConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.SearchStrategyConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.utils.log.FrameworkLoggingLevel;


@PlannerSolverConfiguration(
		solver = PseudoControllabilityAwareSolver.class,
		timeout = 300000
)
@FlawSelectionHeuristicsConfiguration(
		heuristics = ShareworkFlawSelectionHeuristics.class
)
@SearchStrategyConfiguration
@FrameworkLoggerConfiguration(		
		level = FrameworkLoggingLevel.INFO
)
public class ShareworkPlanner extends Planner {

	/**
	 * 
	 */
	protected ShareworkPlanner() {
		super();
	}
}
