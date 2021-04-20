package com.github.sharework_taskplanner.taskplanner.heuristics.search;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;


/**
 *
 */
public class ParetoMHS extends ShareworkSearchStrategy
{

	/**
	 * 
	 */
	protected ParetoMHS() {
		super("ParetoMHS");
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
		PlanSynergy pr1 = (PlanSynergy) o1.getDomainSpecificMetric();
		PlanSynergy pr2 = (PlanSynergy) o2.getDomainSpecificMetric();
		
		// get risk as the sum of actual risk and heuristic estimation
		double r1 = pr1.getPlanSynergy() + pr1.getHeuristicSynergy();
		double r2 = pr2.getPlanSynergy() + pr2.getHeuristicSynergy();
		
		// check dominance condition between partial plans
		return m1 < m2 && r1 < r2 && c1 < c2 ? -1 : m1 > m2 && r1 > r2 && c1 > c2 ? 1 :
			// check heuristic distance to solutions
			o1.getPlanHeuristicCost()[0] < o2.getPlanHeuristicCost()[0] ? -1 : o1.getPlanHeuristicCost()[0] > o2.getPlanHeuristicCost()[0] ? 1 :
				// check heuristics makespan
				m1 < m2 ? -1 : m1 > m2 ? 1 :
					// check synergy
					r1 < r2 ? -1 : r1 > r2 ? 1 :  
						// check heuristic distance to solutions
						c1 < c2 ? -1 : c1 > c2 ? 1 : 0;
				
	}
}


