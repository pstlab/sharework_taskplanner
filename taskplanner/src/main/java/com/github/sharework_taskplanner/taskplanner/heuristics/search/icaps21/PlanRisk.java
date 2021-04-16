package com.github.sharework_taskplanner.taskplanner.heuristics.search.icaps21;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.bson.Document;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import it.cnr.istc.pst.platinum.ai.deliberative.solver.DecisionVariable;
import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.ComponentValue;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.flaw.Flaw;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.lang.flaw.FlawType;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.resolver.plan.Goal;

/**
 * 
 * @author alessandroumbrico
 *
 */
public class PlanRisk 
{
	protected static Map<ComponentValue, List<List<ComponentValue>>> pgraph;		// planning graph
	protected static DomainComponent robot;
	protected static DomainComponent human;
	protected static double SYN_MAX;
	
	private double planSynergy;	
	private double heuristicSynergy;
	
	private MongoCollection<Document> collection;
	
	/**
	 * 
	 * @param node
	 * @param collection
	 */
	protected PlanRisk(SearchSpaceNode node, MongoCollection<Document> collection) {//double pRisk, double hRisk) {
		// set collection 
		this.collection = collection;
		// compute plan synegy
		double[] synergy = this.computePlanSynergy(node);
		// set plan synergy 
		this.planSynergy = synergy[0];
		// set heuristic synergy 
		this.heuristicSynergy = synergy[1];
	}
	
	/**
	 * 
	 * @return
	 */
	public double getHeuristicRisk() {
		return heuristicSynergy;
	}
	
	/**
	 * 
	 * @return
	 */
	public double getPlanRisk() {
		return planSynergy;
	}
	
	/**
	 * 
	 * @param collection
	 * @return
	 */
	private double[] computePlanSynergy(SearchSpaceNode node) 
	{
		// set plan risk
		double risk = 0;
		
		// get partila plan 
		Map<DomainComponent, List<DecisionVariable>> plan = node.getPartialPlan();
		
		// chceck variable
		if (robot != null && human != null) 
		{
			// get robot tasks from the plan 
			List<DecisionVariable> rTasks = plan.get(robot);
			if (rTasks != null) 
			{
				for (DecisionVariable rTask : rTasks) 
				{
					// set robot task risk
					double rTaskRisk = 0;
					// list of overlapping human tasks
					List<DecisionVariable> hOverTasks = new ArrayList<>();
					// check robot task
					if (!rTask.getValue().equals("Idle")) 
					{
						// check human overlapping tasks 
						List<DecisionVariable> hTasks = plan.get(human);
						if (hTasks != null) 
						{
							for (DecisionVariable hTask : hTasks) {
								// check value
								if (!hTask.getValue().equals("Idle")) 
								{
									// check robot bounds
									long[] rTaskStart = rTask.getStart();
									long[] rTaskEnd = rTask.getEnd();
									// check human bounds 
									long[] hTaskStart = hTask.getStart();
									long[] hTaskEnd = hTask.getEnd();
									
									// check overlapping conditions
									if ((rTaskStart[0] <= hTaskStart[0] && rTaskEnd[0] >= hTaskStart[0]) || 
											(rTaskStart[0] >= hTaskStart[0] && hTaskEnd[0] >= rTaskStart[0])) 
									{
										// add human task to overlapping ones
										hOverTasks.add(hTask);
									}
								}
							}
						}
					}
					
					
					// compute risks by taking into account possible overlaps
					for (DecisionVariable hTask : hOverTasks) 
					{
						String[] rSplits = rTask.getValue().split("-");
						String[] hSplits = hTask.getValue().split("-");
						
						// set robot task name
						String rTaskName = rSplits[0].replace("_", "").toLowerCase() + "-" + (rSplits[1].contains("box") ? rSplits[2] : rSplits[1]);
						String hTaskName = hSplits[0].replace("_", "").toLowerCase() + "-" + (hSplits[1].contains("box") ? hSplits[2] : hSplits[1]);
						
						
						// get dynamic risk record from the dataset
						Document record = this.collection.find(Filters.and(
								Filters.eq("human-task", hTaskName), 
								Filters.eq("robot-task", rTaskName))).first();
						
						// check record
						if (record != null) 
						{
							// get risk value
							Object riskValue = record.get("risk-dynamic");
							if (riskValue instanceof Number) {
								// get risk from the record
								rTaskRisk += ((Number) riskValue).doubleValue();
							}
						}
						else {
							// set maxium risk value as there is no information concerning the combination
							rTaskRisk += SYN_MAX;
						}
					}
					
					
					
					if (!hOverTasks.isEmpty()) {
						// set average risk 
						rTaskRisk = rTaskRisk / hOverTasks.size();
					}
					else {
						// no overlapping, set max risk
						rTaskRisk = SYN_MAX; 
					}
					
					// increment plan risk 
					risk += rTaskRisk;
				}
			}
		}
		
		// compute a pessimistic estimation of the risk for subgoals
		double expectedRisk = 0;
		// get agenda
		Set<Flaw> flaws = node.getAgenda();
		// check planning goals
		for (Flaw flaw : flaws) 
		{
			// check type 
			if (flaw.getType().equals(FlawType.PLAN_REFINEMENT)) 
			{
				// check decomposition graph
				Goal goal = (Goal) flaw;
				// compute expected risk 
				expectedRisk += this.computeHeuristicSynergy(
						goal.getDecision().getValue(), 
						robot);
			}
		}

		// get plan risk and expected risk
		return new double[] {
				risk, 
				expectedRisk};
	}
	
	/**
	 * 
	 * @param goal
	 * @param rComp
	 * @return
	 */
	private double computeHeuristicSynergy(ComponentValue value, DomainComponent rComp) 
	{
		// check component
		if (value.getComponent().getName().equals(rComp.getName())) {
			// update expected risk by assigning the maxium risk (pessimistic evaluation)
			return SYN_MAX;
		}
		else 
		{
			// expected risk of the decomposition graph
			double expectedRisk = 0.0;
			// visit decomposition graph
			if (pgraph.containsKey(value)) 
			{
				// get subgoals
				List<List<ComponentValue>> subgraphs = pgraph.get(value);
				for (List<ComponentValue> subgraph : subgraphs)
				{
					// compute subgraph risk 
					double subgraphRisk = 0.0;
					for (ComponentValue subgoal : subgraph) {
						// update subgraph risk
						subgraphRisk += this.computeHeuristicSynergy(subgoal, rComp);
					}
					
					// keep the maxium of alternative subgraphs
					expectedRisk = Math.max(expectedRisk, subgraphRisk);
				}
			}
			
			// get resulting expected risk
			return expectedRisk;
		}
	}
}
