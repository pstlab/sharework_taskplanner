package com.github.sharework_taskplanner.taskplanner;

import com.github.sharework_taskplanner.taskplanner.heuristics.flaws.ShareworkFlawSelectionHeuristics;
import com.github.sharework_taskplanner.taskplanner.heuristics.search.HRBalancing;
import com.github.sharework_taskplanner.taskplanner.heuristics.search.ParetoMHS;
import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.StandardDeviationMinimizationSearchStrategy;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.FrameworkLoggerConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.FlawSelectionHeuristicsConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.PlannerSolverConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.SearchStrategyConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.utils.log.FrameworkLoggingLevel;


@PlannerSolverConfiguration
@FlawSelectionHeuristicsConfiguration(
		heuristics = ShareworkFlawSelectionHeuristics.class
)
@SearchStrategyConfiguration(
		strategy = HRBalancing.class
		//strategy = ParetoMHS.class
		//strategy = StandardDeviationMinimizationSearchStrategy.class
)
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
