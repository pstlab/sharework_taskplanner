package com.github.sharework_taskplanner.taskplanner.heuristics.search;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.DecisionVariable;
import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;

import java.util.ArrayList;
import java.util.List;


/**
 *
 */
public class HRBalancing extends ShareworkSearchStrategy
{

	/**
	 *
	 */
	protected HRBalancing() {
		super("HRBalancing");
	}

	/**
	 * 
	 */
	@Override
	public int compare(SearchSpaceNode o1, SearchSpaceNode o2) {

		// check robot list of activities
		DomainComponent robot = null;
		try {
			robot = this.pdb.getComponentByName("Cobot");
		} catch (Exception ex) {
			try {
				robot = this.pdb.getComponentByName("Robot");
			} catch (Exception exx) {
				debug("No component with name \"Cobot\" or \"Robot\" found");
			}
		}

		// check human list of activities
		DomainComponent human = null;
		try {
			human = this.pdb.getComponentByName("Worker");
		} catch (Exception ex) {
			try {
				human = this.pdb.getComponentByName("Human");
			} catch (Exception exx) {
				debug("No component with name \"Human\" or \"Cobot\" found");
			}
		}

		List<DecisionVariable> rlist1 = new ArrayList<>();
		List<DecisionVariable> hlist1 = new ArrayList<>();
		List<DecisionVariable> rlist2 = new ArrayList<>();
		List<DecisionVariable> hlist2 = new ArrayList<>();

		// check components
		if (robot != null && human != null) {

			// set list from plan 1
			if (o1.getPartialPlan().get(robot) != null) {
				rlist1 = o1.getPartialPlan().get(robot);
			}

			if (o1.getPartialPlan().get(human) != null) {
				hlist1 = o1.getPartialPlan().get(human);
			}

			// get list from plan 2
			if (o2.getPartialPlan().get(robot) != null) {
				rlist2 = o2.getPartialPlan().get(robot);
			}

			if (o2.getPartialPlan().get(human) != null) {
				hlist2 = o2.getPartialPlan().get(human);
			}
		}

		// compute balance
		double b1 = Math.abs(rlist1.size() - hlist1.size());
		double b2 = Math.abs(rlist2.size() - hlist2.size());

		// greedy search supported by  HR balance
		return b1 < b2 ? -1 : b1 > b2 ? 1 :
				o1.getPlanHeuristicCost()[0] < o2.getPlanHeuristicCost()[0] ? -1 : o1.getPlanHeuristicCost()[0] > o2.getPlanHeuristicCost()[0] ? 1 :
						o1.getDepth() > o2.getDepth() ? -1 : o1.getDepth() < o2.getDepth() ? 1 :
							0;
	}
}


