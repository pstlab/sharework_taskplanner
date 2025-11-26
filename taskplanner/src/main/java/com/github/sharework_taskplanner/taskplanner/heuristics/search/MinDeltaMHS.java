package com.github.sharework_taskplanner.taskplanner.heuristics.search;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;

/**
 *
 */
public class MinDeltaMHS extends ShareworkSearchStrategy
{
	/**
	 *
	 */
	protected MinDeltaMHS() {
		super("MinDeltaMHS");
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
		DomainComponent robot = this.pdb.getComponentByName("Robot");
		// get human component
		DomainComponent human = this.pdb.getComponentByName("Human");
				
				
		// check robot makespan of
		Double[] rMk1 = new Double[] {0.0, 0.0};
		if (o1.getMakespan().containsKey(robot)) {
			// set robot makespan
			rMk1 = o1.getMakespan().get(robot);
			// add heuristic evaluation
			rMk1[0] += o1.getHeuristicMakespan().get(robot)[0];
			rMk1[1] += o1.getHeuristicMakespan().get(robot)[1];
		}
		
		Double[] hMk1 = new Double[] {0.0, 0.0}; 
		if (o1.getMakespan().containsKey(human)) {
			// set human makespan
			hMk1 = o1.getMakespan().get(human);
			// add heuristic evaluation
			hMk1[0] += o1.getHeuristicMakespan().get(human)[0];
			hMk1[1] += o1.getHeuristicMakespan().get(human)[1];
		}
		
		// get delta
		double d1 = Math.abs(rMk1[0] - hMk1[0]);
		
		
		// check human makespan 
		Double[] rMk2 = new Double[] {0.0, 0.0};
		if (o2.getMakespan().containsKey(robot)) {
			// set robot makespan
			rMk2 = o2.getMakespan().get(robot);
			// add heuristic evaluation
			rMk2[0] += o2.getHeuristicMakespan().get(robot)[0];
			rMk2[1] += o2.getHeuristicMakespan().get(robot)[1];
		}
		
		Double[] hMk2 = new Double[] {0.0, 0.0};
		if (o2.getMakespan().containsKey(human)) {
			// set human makespan
			hMk2 = o2.getMakespan().get(human);
			// add heuristic evaluation
			hMk2[0] += o2.getHeuristicMakespan().get(human)[0];
			hMk2[1] += o2.getHeuristicMakespan().get(human)[1];
		
		}
		
		// get delta
		double d2 = Math.abs(rMk2[0] - hMk2[0]);
		
		// check dominance condition between partial plans
		return m1 < m2 && d1 < d2 && r1 < r2 ? -1 : m1 > m2 && d1 > d2 && r1 > r2 ? 1 :
			// check heuristic distance to solutions
			o1.getPlanHeuristicCost()[0] < o2.getPlanHeuristicCost()[0] ? -1 : o1.getPlanHeuristicCost()[0] > o2.getPlanHeuristicCost()[0] ? 1 :
				// check delta
				d1 < d2 ? -1 : d1 > d2 ? 1 :
					// check synergy 
					r1 < r2 ? -1 : r1 > r2 ? 1 : 
						// check cost
						c1 < c2 ? -1 : c1 > c2 ? 1 : 0; 
	}
}
