package com.github.sharework_taskplanner.taskplanner.platform.goizper;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaFeedbackListener;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageUnmarshalingException;
import geometry_msgs.Pose;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedback;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedbackType;
import moveit_msgs.*;

import java.util.concurrent.atomic.AtomicLong;

/**
 *
 */
public class MotionFeedbackListener extends RosJavaFeedbackListener<ExecuteTrajectoryActionFeedback> {

    private static final AtomicLong feedbackIdCounter = new AtomicLong(0);

    /**
     *
     * @param proxy
     */
    protected MotionFeedbackListener(RosJavaPlatformProxy proxy) {
        super(proxy);

    }


    /**
     *
     * @return
     */
    @Override
    public String getMessageType() {
        return Pose._TYPE;
    }

    /**
     *
     * @param feedback
     * @return
     * @throws MessageUnmarshalingException
     */
    @Override
    public PlatformFeedback unmarshal(ExecuteTrajectoryActionFeedback feedback)
            throws MessageUnmarshalingException {

        // get dispatched command
        PlatformCommand dispatched = MotionRequestPublisher.DISPATCHED_MOTION_COMMAND;
        // check information about dispatched command
        if (dispatched == null) {
            // warning
            this.log.warn("[MotionFeedbackListener] No information about dispatched commands is available... ");
            throw new MessageUnmarshalingException("[MotionFeedbackListener] No information about dispatched commands is available...");
        }

        // print message
        this.log.info("[MotionFeedbackListener] Received motion feedback:\n" +
                "- Status: " + feedback.getStatus().getStatus() + "\n" +
                "- Feedback: " + feedback + "\n");

        // prepare feedback
        PlatformFeedback pFeedback = null;
        // check feedback code
        if (feedback.getStatus().getStatus() == 3) {

            // successful execution
            pFeedback = new PlatformFeedback(
                    feedbackIdCounter.getAndIncrement(),
                    dispatched,
                    PlatformFeedbackType.SUCCESS);

        } else {

            // execution failure
            pFeedback = new PlatformFeedback(
                    feedbackIdCounter.getAndIncrement(),
                    dispatched,
                    PlatformFeedbackType.FAILURE);
        }

        // clear information about dispatched command
        MotionRequestPublisher.DISPATCHED_MOTION_COMMAND = null;
        // get platform feedback
        return pFeedback;
    }
}
