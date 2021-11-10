package com.github.sharework_taskplanner.taskplanner.platform.goizper;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaCommandPublisher;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageMarshalingException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import geometry_msgs.Quaternion;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.ros.node.ConnectedNode;


import java.util.Arrays;

import static com.mongodb.client.model.Filters.eq;

/**
 *
 */
public class MotionRequestPublisher extends RosJavaCommandPublisher<geometry_msgs.Pose> {

    public static PlatformCommand DISPATCHED_MOTION_COMMAND = null;


    /**
     *
     * @param proxy
     */
    protected MotionRequestPublisher(RosJavaPlatformProxy proxy) {
        super(proxy);
    }

    /**
     *
     * @return
     */
    @Override
    public String getMessageType() {
        return geometry_msgs.Pose._TYPE;
    }

    /**
     *
     * @param node
     * @param cmd
     * @return
     * @throws MessageMarshalingException
     */
    @Override
    public geometry_msgs.Pose marshal(ConnectedNode node, PlatformCommand cmd)
            throws MessageMarshalingException {

        this.log.info("[MotionRequestPublisher] Dispatching motion execution request:\n" +
                "- cmd: " + cmd + "\n");

        // prepare pose
        geometry_msgs.Pose pose = null;

        // create connection to local
        try (MongoClient client = MongoClients.create()) {

            // get local db
            MongoDatabase db = client.getDatabase("sharework_deployment");
            // get collection
            MongoCollection<Document> dataset = db.getCollection("goizper");

            // get pose ID from predicate
            long poseId = Long.parseLong(cmd.getParamValues()[0]);
            Bson filter = eq("poseId", poseId);
            Document doc = dataset.find(filter).first();
            if (doc == null) {

                // error
                log.warn("[MotionRequestPublisher] No pose found with ID \"" + poseId + "\" in the local DB...");
                throw new RuntimeException("[MotionRequestPublisher] No pose found with ID \"" + poseId + "\" in the local DB...");

            } else {

                log.info("[MotionRequestPublisher] Pose found wit ID " + poseId + ":\n" +
                        "- doc: " + doc.toJson() + "\n");

                // set data
                pose = node.getTopicMessageFactory().newFromType(geometry_msgs.Pose._TYPE);

                // get position point
                geometry_msgs.Point point = node.getTopicMessageFactory().newFromType(geometry_msgs.Point._TYPE);
                // get data point
                Document pData = (Document) doc.get("points");
                // set coordinates
                point.setX(pData.getDouble("x") == null ? pData.getInteger("x") : pData.getDouble("x"));
                point.setY(pData.getDouble("y") == null ? pData.getInteger("y") : pData.getDouble("y"));
                point.setZ(pData.getDouble("z") == null ? pData.getInteger("z") : pData.getDouble("z"));
                // set point
                pose.setPosition(point);


                // get position quaternion
                geometry_msgs.Quaternion quat = node.getTopicMessageFactory().newFromType(Quaternion._TYPE);
                // get data quaternion
                Document pQuat = (Document) doc.get("quaternions");
                // set orientation
                quat.setX(pQuat.getDouble("x") == null ? pQuat.getInteger("x") : pQuat.getDouble("x"));
                quat.setY(pQuat.getDouble("y") == null ? pQuat.getInteger("y") : pQuat.getDouble("y"));
                quat.setZ(pQuat.getDouble("z") == null ? pQuat.getInteger("z") : pQuat.getDouble("z"));
                quat.setW(pQuat.getDouble("w") == null ? pQuat.getInteger("w") : pQuat.getDouble("w"));
                // set orientation
                pose.setOrientation(quat);

            }

        }

        // set dispatched motion command
        DISPATCHED_MOTION_COMMAND = cmd;
        this.log.info("[MotionRequestPublisher] Updated dispatched command:\n" +
                "- ID: " + cmd.getId() + "\n" +
                "- Name: " + cmd.getName() + "\n" +
                "- Params: " + Arrays.asList(cmd.getParamValues()).toString() + "\n");

        // get generated pose
        return pose;
    }
}
