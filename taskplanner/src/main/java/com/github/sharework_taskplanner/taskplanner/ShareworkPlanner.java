package com.github.sharework_taskplanner.taskplanner;

import it.cnr.istc.pst.platinum.ai.deliberative.Planner;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.FrameworkLoggerConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.FlawSelectionHeuristicsConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.PlannerSolverConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.SearchStrategyConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.utils.log.FrameworkLoggingLevel;


@PlannerSolverConfiguration(
		timeout = 300000
)
@FlawSelectionHeuristicsConfiguration
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
