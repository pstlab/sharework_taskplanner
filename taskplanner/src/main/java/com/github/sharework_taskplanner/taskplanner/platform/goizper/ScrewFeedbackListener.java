package com.github.sharework_taskplanner.taskplanner.platform.goizper;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaFeedbackListener;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageUnmarshalingException;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedback;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedbackType;
import org.xbill.DNS.Message;

import java.util.concurrent.atomic.AtomicLong;

/**
 *
 */
public class ScrewFeedbackListener extends RosJavaFeedbackListener<task_planner_interface_msgs.TaskExecutionFeedback> {

    private static final AtomicLong feedbackIdCounter = new AtomicLong(0);

    /**
     *
     * @param proxy
     */
    protected ScrewFeedbackListener(RosJavaPlatformProxy proxy) {
        super(proxy);

    }


    /**
     *
     * @return
     */
    @Override
    public String getMessageType() {
        return task_planner_interface_msgs.TaskExecutionFeedback._TYPE;
    }

    /**
     *
     * @param feedback
     * @return
     * @throws MessageUnmarshalingException
     */
    @Override
    public PlatformFeedback unmarshal(task_planner_interface_msgs.TaskExecutionFeedback feedback)
            throws MessageUnmarshalingException {

        // get dispatched command
        PlatformCommand cmd = this.proxy.getDispatchedCommand(feedback.getCmdId());
        // platform feedback
        PlatformFeedback pFeedback = null;

        // check command
        if (cmd != null) {

            // print message
            this.log.info("[ScrewFeedbackListener] Received screw feedback:\n" +
                    "- Command-ID: " + feedback.getCmdId() + "\n" +
                    "- Command result: " + feedback.getCmdResult() + "\n");

            // create positive feedback
            pFeedback = new PlatformFeedback(
                    feedbackIdCounter.getAndIncrement(),
                    cmd,
                    PlatformFeedbackType.SUCCESS);

        } else {

            // no command found
            throw new MessageUnmarshalingException("[ScrewFeedbackListener] No command associated to the received feedback:\n" +
                    "- Command-ID: " + feedback.getCmdId() + "\n" +
                    "- Command result: " + feedback.getCmdResult() + "\n");
        }

        // get platform feedback
        return pFeedback;
    }
}
