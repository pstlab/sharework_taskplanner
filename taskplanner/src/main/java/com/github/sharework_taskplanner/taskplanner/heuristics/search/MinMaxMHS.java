package com.github.sharework_taskplanner.taskplanner.heuristics.search;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;
import org.chocosolver.solver.constraints.nary.automata.FA.utils.Bounds;

/**
 *
 */
public class MinMaxMHS extends ShareworkSearchStrategy
{
	/**
	 *
	 */
	protected MinMaxMHS() {
		super("MinMaxMHS");
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
		
		// get robot component 
		DomainComponent robot = this.pdb.getComponentByName("Cobot");
		// get human component
		DomainComponent human = this.pdb.getComponentByName("Worker");
				
				
		// check max makespan
		double max1 = 0;
		if (o1.getMakespan().containsKey(robot) && 
				o1.getMakespan().containsKey(human)) {
			// take the max between human and robot makespan
			max1 = Math.max(
					o1.getMakespan().get(robot)[0] + o1.getHeuristicMakespan().get(robot)[0], 
					o1.getMakespan().get(human)[0] + o1.getHeuristicMakespan().get(human)[0]);
		}
		
		// check max makespan
		double max2 = 0;
		if (o2.getMakespan().containsKey(robot) && 
				o2.getMakespan().containsKey(human)) {
			// take the max between human and robot makespan
			max2 = Math.max(
					o2.getMakespan().get(robot)[0] + o2.getHeuristicMakespan().get(robot)[0], 
							o2.getMakespan().get(human)[0] + o2.getHeuristicMakespan().get(human)[0]);
		}
		
		// check dominance condition between partial plans
		return m1 < m2 && max1 < max2 && r1 < r2 ? -1 : m1 > m2 && max1 > max2 && r1 > r2 ? 1 :
			// check heuristic distance to solutions
			o1.getPlanHeuristicCost()[0] < o2.getPlanHeuristicCost()[0] ? -1 : o1.getPlanHeuristicCost()[0] > o2.getPlanHeuristicCost()[0] ? 1 :
				// check delta
				max1 < max2 ? -1 : max1 > max2 ? 1 :
					// check the synergy
					r1 < r2 ? -1 : r1 > r2 ? 1 : 
						// check cost
						c1 < c2 ? -1 : c1 > c2 ? 1 : 0; 
	}
}
