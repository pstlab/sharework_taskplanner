package com.github.sharework_taskplanner.taskplanner.platform.stiima;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaFeedbackListener;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageUnmarshalingException;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedback;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedbackType;

import java.util.concurrent.atomic.AtomicLong;

/**
 *
 */
public class MotionTaskFeedbackListener extends RosJavaFeedbackListener<task_planner_interface_msgs.MotionTaskExecutionFeedback>
{
	private static final AtomicLong feedbackIdCounter = new AtomicLong(0);

	private static final PlatformFeedbackType[] RESULT = new PlatformFeedbackType[] {

			PlatformFeedbackType.FAILURE,			// index 0 -> execution failure

			PlatformFeedbackType.SUCCESS,			// index 1 -> successful execution
	};

	/**
	 *
	 * @param proxy
	 */
	protected MotionTaskFeedbackListener(RosJavaPlatformProxy proxy) {
		super(proxy);
	}

	/**
	 *
	 * @return
	 */
	@Override
	public String getMessageType() {
		return task_planner_interface_msgs.MotionTaskExecutionFeedback._TYPE;
	}

	/**
	 *
	 * @param message
	 * @return
	 * @throws MessageUnmarshalingException
	 */
	@Override
	public PlatformFeedback unmarshal(task_planner_interface_msgs.MotionTaskExecutionFeedback message)
			throws MessageUnmarshalingException {

		// retrieve issued command
		PlatformCommand cmd = this.proxy.getDispatchedCommand(message.getCmdId());
		if (cmd == null) {
			// throw exception
			throw new MessageUnmarshalingException("Received feedback about a non-dispatched command:\n" +
					"\t- CommandId= " + message.getCmdId() + "\n" +
					"\t- Feedback= " + message + "\n");
		}

		// create robot action feedback
		PlatformFeedback feedback = new PlatformFeedback(
				feedbackIdCounter.getAndIncrement(),
				cmd,
				RESULT[(int) message.getResult()]);

		// print message
		this.log.info("[MotionTaskFeedbackListener] Received feedback about dispatched command:\n" +
				"- cmd= " + cmd + "\n" +
				"- feedback= " + feedback + "\n");

		// get feedback
		return feedback;
	}
}
