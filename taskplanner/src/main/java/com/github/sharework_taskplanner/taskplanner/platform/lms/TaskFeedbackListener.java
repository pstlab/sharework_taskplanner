package com.github.sharework_taskplanner.taskplanner.platform.lms;

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
public class TaskFeedbackListener extends RosJavaFeedbackListener<task_planner_interface_msgs.TaskExecutionFeedback>
{
	private static final AtomicLong feedbackIdCounter = new AtomicLong(0);

	private static final PlatformFeedbackType[] RESULT = new PlatformFeedbackType[] {

			PlatformFeedbackType.FAILURE,			// index 1 -> successful execution

			PlatformFeedbackType.SUCCESS,			// index 0 -> execution failure
	};

	/**
	 *
	 * @param proxy
	 */
	protected TaskFeedbackListener(RosJavaPlatformProxy proxy) {
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
	 * @param message
	 * @return
	 * @throws MessageUnmarshalingException
	 */
	@Override
	public PlatformFeedback unmarshal(task_planner_interface_msgs.TaskExecutionFeedback message)
			throws MessageUnmarshalingException {

		// retrieve issued command
		PlatformCommand cmd = this.proxy.getDispatchedCommand(message.getCmdId());
		if (cmd == null) {
			// no command found
			throw new MessageUnmarshalingException("Received feedback about a non-dispatched command:\n" +
					"\t- CommandId: " + message.getCmdId() + "\n" +
					"\t- Feedback: " + message + "\n");
		}

		// set feedback
		PlatformFeedback feedback = new PlatformFeedback(
					feedbackIdCounter.getAndIncrement(),
					cmd,
					RESULT[(int) message.getCmdResult()]);

		// get platform feedback
		return feedback;
	}
}
