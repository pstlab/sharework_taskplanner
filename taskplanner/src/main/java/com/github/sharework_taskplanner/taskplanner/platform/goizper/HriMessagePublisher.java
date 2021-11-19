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
public class HriMessagePublisher extends RosJavaCommandPublisher<std_msgs.String> {

    public static PlatformCommand DISPATCHED_MOTION_COMMAND = null;


    /**
     *
     * @param proxy
     */
    protected HriMessagePublisher(RosJavaPlatformProxy proxy) {
        super(proxy);
    }

    /**
     *
     * @return
     */
    @Override
    public String getMessageType() {
        return std_msgs.String._TYPE;
    }

    /**
     *
     * @param node
     * @param cmd
     * @return
     * @throws MessageMarshalingException
     */
    @Override
    public std_msgs.String marshal(ConnectedNode node, PlatformCommand cmd)
            throws MessageMarshalingException {

        this.log.info("[HriMessagePublisher] Publishing HRI message:\n" +
                "- cmd: " + cmd + "\n");

        // create message to publish
        std_msgs.String msg = node.getTopicMessageFactory().newFromType(std_msgs.String._TYPE);
        // set message data
        msg.setData("terminated");

        // get generated message
        return msg;
    }
}
