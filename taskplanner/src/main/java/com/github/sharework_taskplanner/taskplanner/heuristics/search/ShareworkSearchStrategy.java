package com.github.sharework_taskplanner.taskplanner.heuristics.search;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import it.cnr.istc.pst.platinum.ai.deliberative.solver.SearchSpaceNode;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.SearchStrategy;
import it.cnr.istc.pst.platinum.ai.deliberative.strategy.ex.EmptyFringeException;
import it.cnr.istc.pst.platinum.ai.framework.domain.component.DomainComponent;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.lifecycle.PostConstruct;
import org.bson.Document;

import java.util.Map;

/**
 *
 */
public abstract class ShareworkSearchStrategy extends SearchStrategy {

    protected static final double SYN_MAX = 50.0;
    protected MongoClient heuristicDataset;

    /**
     *
     * @param label
     */
    protected ShareworkSearchStrategy(String label) {
        super(label);
        // setup connection with (local) heuristic DB
        this.heuristicDataset = MongoClients.create();
    }

    /**
     *
     */
    @PostConstruct
    protected void init() {
        super.init();

        // set static field of plan synergy
        PlanSynergy.SYN_MAX = SYN_MAX;
        PlanSynergy.pgraph = this.pgraph;
        PlanSynergy.robot = this.pdb.getComponentByName("Cobot");
        PlanSynergy.human = this.pdb.getComponentByName("Worker");
    }

    /**
     *
     */
    @Override
    public void clear() {
        // close DB client
        this.heuristicDataset.close();
        // finalize clear
        super.clear();
    }

    /**
     *
     */
    @Override
    public SearchSpaceNode dequeue()
            throws EmptyFringeException {

        // extract a node from the fringe
        SearchSpaceNode node = super.dequeue();
        // get risk
        PlanSynergy risk = (PlanSynergy) node.getDomainSpecificMetric();

        // check node information
        System.out.println("Current plan { "
                + "\"plan-makespan\": [" + node.getPlanMakespan()[0]  + ", " + node.getPlanMakespan()[1] + "], "
                + "\"heuristic-makespan\" [" + node.getPlanHeuristicMakespan()[0] + ", " + node.getPlanHeuristicMakespan()[1] + "], "
                + "\"plan-cost\": " + node.getPlanCost() + ", "
                + "\"heuristic-cost\": [" + node.getPlanHeuristicCost()[0] + ", " + node.getPlanHeuristicCost()[1] + "], "
                + "\"plan-synergy\": " + risk.getPlanSynergy() + ", "
                + "\"heuristic-synergy\": " + risk.getHeuristicSynergy() + ", "
                + "}");

        // set debug information
        debug("Current plan { "
                + "\"plan-makespan\": [" + node.getPlanMakespan()[0]  + ", " + node.getPlanMakespan()[1] + "], "
                + "\"heuristic-makespan\" [" + node.getPlanHeuristicMakespan()[0] + ", " + node.getPlanHeuristicMakespan()[1] + "], "
                + "\"plan-cost\": " + node.getPlanCost() + ", "
                + "\"heuristic-cost\": [" + node.getPlanHeuristicCost()[0] + ", " + node.getPlanHeuristicCost()[1] + "], "
                + "\"plan-synergy\": " + risk.getPlanSynergy() + ", "
                + "\"heuristic-synergy\": " + risk.getHeuristicSynergy() + ", "
                + "}");
        // get node
        return node;
    }

    /**
     *
     * @param node
     */
    protected void registerSearchChoice(SearchSpaceNode node)
    {
        // check DB collection
        if (this.collection != null)
        {
            // create solving statistic record
            Document doc = new Document("step", node.getId());
            doc.append("fringe-size", this.fringe.size());
            doc.append("node-number-of-flaws", node.getNumberOfFlaws());
            doc.append("node-depth", node.getDepth());

            // consolidated values of metrics
            doc.append("node-plan-cost", node.getPlanCost());
            doc.append("node-plan-makespan-min", node.getPlanMakespan()[0]);
            doc.append("node-plan-makespan-max", node.getPlanMakespan()[1]);

            // heuristic estimation of metrics
            doc.append("node-heuristic-plan-cost-min", node.getPlanHeuristicCost()[0]);
            doc.append("node-heuristic-plan-cost-max", node.getPlanHeuristicCost()[1]);
            doc.append("node-heuristic-plan-makespan-min", node.getPlanHeuristicMakespan()[0]);
            doc.append("node-heuristic-plan-makespan-max", node.getPlanHeuristicMakespan()[1]);


            // get synergy information
            PlanSynergy syn = (PlanSynergy) node.getDomainSpecificMetric();

            // synergy
            doc.append("node-plan-synergy", syn.getPlanSynergy());
            doc.append("node-heuristic-plan-synergy", syn.getHeuristicSynergy());


            // get robot component
            DomainComponent robot = this.pdb.getComponentByName("Cobot");
            // get human component
            DomainComponent human = this.pdb.getComponentByName("Worker");

            // check robot  and human makespan
            Double[] rmk = new Double[] {0.0, 0.0};
            if (node.getMakespan().containsKey(robot)) {
                rmk = node.getMakespan().get(robot);
            }

            Double[] hmk = new Double[] {0.0, 0.0};
            if (node.getMakespan().containsKey(human)) {
                hmk = node.getMakespan().get(human);
            }

            // R-H makespan
            doc.append("node-plan-makespan-robot", rmk[0]);
            doc.append("node-plan-makespan-human", hmk[0]);

            // insert data into the collection
            this.collection.insertOne(doc);
        }
    }

    /**
     *
     */
    @Override
    public void enqueue(SearchSpaceNode node)
    {
        // compute heuristic cost
        Map<DomainComponent, Double[]> hc = this.computeHeuristicCost(node);
        // set planning distance as heuristics
        node.setHeuristicCost(hc);

        // compute heuristic makespan
        Map<DomainComponent, Double[]> hm = this.computeHeuristicMakespan(node);
        // set heuristic
        node.setHeuristicMakespan(hm);

        // create plan synergy
        PlanSynergy pSyn = new PlanSynergy(node, this.getHeuristicDataset());
        // set additional metric
        node.setDomainSpecificMetric(pSyn);

        // add the node to the priority queue
        this.fringe.offer(node);
    }

    /**
     *
     * @return
     */
    protected MongoCollection<Document> getHeuristicDataset()
    {
        // get data-base
        MongoDatabase db = this.heuristicDataset.getDatabase("sharework_cembre");
        // select data-set
        MongoCollection<Document> collection = db.getCollection("hrc_task_dynamic_risks");
        // return collection
        return collection;
    }

}
