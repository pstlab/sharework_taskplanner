package com.github.sharework_taskplanner.taskplanner.heuristics.flaws;

import it.cnr.istc.pst.platinum.ai.deliberative.heuristic.pipeline.PipelineFlawSelectionHeuristic;
import it.cnr.istc.pst.platinum.ai.deliberative.heuristic.pipeline.ReverseHierarchyFlawInspector;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.deliberative.PipelineConfiguration;

/**
 *
 */
@PipelineConfiguration(pipeline= {
		//PlanFlawInspector.class,
		ReverseHierarchyFlawInspector.class,
		//DegreeFlawInspector.class
})
public class ShareworkFlawSelectionHeuristics extends PipelineFlawSelectionHeuristic 
{
	/**
	 * 
	 */
	protected ShareworkFlawSelectionHeuristics() {
		super();
	}
}
