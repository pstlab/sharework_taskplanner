package com.github.sharework_taskplanner.taskplanner.testing.planning.stiima.nosyn;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;

/**
 * 
 * @author alessandroumbrico
 *
 */
public class MinMaxMHSNoSyn extends MHSNoSyn 
{
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
		
		// get robot component 
		DomainComponent robot = this.pdb.getComponentByName("Robot");
		// get human component
		DomainComponent human = this.pdb.getComponentByName("Human");
				
				
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
		
		// chekc dominancy between partial plans
		return m1 < m2 && max1 < max2 ? -1 : m1 > m2 && max1 > max2 ? 1 :
			// check heuristic distance to solutions
			o1.getPlanHeuristicCost()[0] < o2.getPlanHeuristicCost()[0] ? -1 : o1.getPlanHeuristicCost()[0] > o2.getPlanHeuristicCost()[0] ? 1 :
				// check delta
				max1 < max2 ? -1 : max1 > max2 ? 1 :
					// check cost
					c1 < c2 ? -1 : c1 > c2 ? 1 : 0; 
	}
}
