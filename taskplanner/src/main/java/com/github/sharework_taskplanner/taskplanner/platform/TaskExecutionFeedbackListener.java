package com.github.sharework_taskplanner.taskplanner.platform;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaFeedbackListener;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageUnmarshalingException;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedback;
import it.cnr.istc.pst.platinum.control.lang.PlatformFeedbackType;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicLong;

/**
 *
 */
public class TaskExecutionFeedbackListener extends RosJavaFeedbackListener<task_planner_interface_msgs.TaskExecutionFeedback>  {

	private static final AtomicLong feedbackIdCounter = new AtomicLong(0);

	private static final PlatformFeedbackType[] RESULT = new PlatformFeedbackType[] {

			PlatformFeedbackType.FAILURE,			// index 0 -> execution failure

			PlatformFeedbackType.SUCCESS,			// index 1 -> successful execution
	};

	/**
	 *
	 * @param proxy
	 */
	protected TaskExecutionFeedbackListener(RosJavaPlatformProxy proxy) {
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
			// throw exception
			throw new MessageUnmarshalingException("[TaskExecutionFeedbackListener] Received feedback about a non-dispatched command:\n" +
					"\t- Command ID: " + message.getCmdId() + "\n" +
					"\t- Feedback: " + message + "\n");
		}

		// create robot action feedback
		PlatformFeedback feedback = new PlatformFeedback(
				feedbackIdCounter.getAndIncrement(),
				cmd,
				RESULT[(int) message.getCmdResult()]);

		// print message
		this.log.info("[TaskExecutionFeedbackListener] Received feedback about dispatched command:\n" +
				"- Command ID: " + cmd.getId() + "\n" +
				"- Task name: " + cmd.getName() + "\n" +
				"- Task parameters: " + Arrays.asList(cmd.getParamValues()) + "\n" +
				"- Feedback: " + feedback + "\n");

		// get feedback
		return feedback;
	}
}
