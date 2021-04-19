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
public class MotionTaskFeedbackListener extends RosJavaFeedbackListener<sharework_taskplanner_msgs.MotionTaskExecutionFeedback>
{
	private static final AtomicLong feedbackIdCounter = new AtomicLong(0);

	private static final PlatformFeedbackType[] RESULT = new PlatformFeedbackType[] {

			PlatformFeedbackType.SUCCESS,			// index 0 -> successful execution

			PlatformFeedbackType. FAILURE			// index 1 -> execution failure
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
		return sharework_taskplanner_msgs.MotionTaskExecutionRequest._TYPE;
	}

	/**
	 *
	 * @param message
	 * @return
	 * @throws MessageUnmarshalingException
	 */
	@Override
	public PlatformFeedback unmarshal(sharework_taskplanner_msgs.MotionTaskExecutionFeedback message)
			throws MessageUnmarshalingException {

		// retrieve issued command
		PlatformCommand cmd = this.proxy.getDispatchedCommand(message.getCmdId());
		if (cmd == null) {
			// throw exception
			throw new MessageUnmarshalingException("Received feedback about a non-dispatched command:\n" +
					"\t- CommandId: " + message.getCmdId() + "\n" +
					"\t- Feedback: " + message + "\n");
		}

		// create robot action feedback
		PlatformFeedback feedback = new PlatformFeedback(
				feedbackIdCounter.getAndIncrement(),
				cmd,
				RESULT[(int) message.getResult()]);

		// get feedback
		return feedback;
	}
}
