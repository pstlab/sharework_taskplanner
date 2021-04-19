package com.github.sharework_taskplanner.taskplanner.platform.stiima;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaCommandPublisher;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageMarshalingException;
import it.cnr.istc.pst.platinum.ai.executive.pdb.ExecutionNode;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import it.cnr.istc.pst.platinum.control.platform.PlatformProxy;
import org.ros.node.ConnectedNode;

import java.util.ArrayList;
import java.util.List;


/**
 * 
 * @author alessandroumbrico
 *
 */
public class MotionTaskRequestPublisher extends RosJavaCommandPublisher<sharework_taskplanner_msgs.MotionTaskExecutionRequestArray>
{
	/**
	 *
	 * @param proxy
	 */
	protected MotionTaskRequestPublisher(RosJavaPlatformProxy proxy) {
		super(proxy);
	}

	/**
	 *
	 * @return
	 */
	@Override
	public String getMessageType() {
		return sharework_taskplanner_msgs.MotionTaskExecutionRequestArray._TYPE;
	}

	/**
	 *
	 * @param node
	 * @param cmd
	 * @return
	 * @throws MessageMarshalingException
	 */
	@Override
	public sharework_taskplanner_msgs.MotionTaskExecutionRequestArray marshal(ConnectedNode node, PlatformCommand cmd)
			throws MessageMarshalingException
	{
		// create message
		sharework_taskplanner_msgs.MotionTaskExecutionRequestArray request = node.getTopicMessageFactory()
				.newFromType(sharework_taskplanner_msgs.MotionTaskExecutionRequestArray._TYPE);
		// set data
		request.setCmdId(cmd.getId());
		// prepare the list of tasks
		List<sharework_taskplanner_msgs.MotionTaskExecutionRequest> tasks = new ArrayList<>();

		// check parameters
		if (cmd.getParamValues().length == 3)
		{
			// create data message
			sharework_taskplanner_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
					newFromType(sharework_taskplanner_msgs.MotionTaskExecutionRequest._TYPE);

			// set message data
			task.setTaskId((cmd.getName().toLowerCase() + cmd.getParamValues()[1]).trim());
			task.setTaskName(cmd.getName().toLowerCase());
			task.setCfgStart(cmd.getParamValues()[0]);
			task.setCfgGoal(cmd.getParamValues()[1]);
			task.setRiskLevel(Float.parseFloat(cmd.getParamValues()[2]));
			task.setExpectedTime((cmd.getNode().getDuration()[1] - cmd.getNode().getDuration()[0]) / 2);
			task.setHumanTasks(new ArrayList<String>());

			// add task
			tasks.add(task);
		}
		else 
		{
			// create data message
			sharework_taskplanner_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
					newFromType(sharework_taskplanner_msgs.MotionTaskExecutionRequest._TYPE);

			// set message data
			task.setTaskId((cmd.getName().toLowerCase() + "-" + cmd.getParamValues()[0]).trim());
			task.setTaskName(cmd.getName().toLowerCase());
			task.setCfgStart("not-set");
			task.setCfgGoal(cmd.getParamValues()[0].trim());
			task.setRiskLevel(Float.parseFloat("0.0"));
			task.setExpectedTime((cmd.getNode().getDuration()[1] - cmd.getNode().getDuration()[0]) / 2);
			task.setHumanTasks(new ArrayList<String>());

			// add task
			tasks.add(task);
		}
		
		// check the next 2 nodes on the component (if any)
		ExecutionNode next = cmd.getNode().getNext();
		int counter = 0;
		while (next != null && counter < 2 && !this.proxy.isPlatformCommand(next)) {
			// get next command	
			next = next.getNext();
			// check if a command has been found
			if (next != null && this.proxy.isPlatformCommand(next))
			{
				// increment counter
				counter++;

				// extract command name
				String name = PlatformProxy.extractCommandName(next);
				// get next command parameters
				String[] params = PlatformProxy.extractCommandParameters(next);

				// create data message
				sharework_taskplanner_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
						newFromType(sharework_taskplanner_msgs.MotionTaskExecutionRequest._TYPE);

				// check parameters
				if (params.length != 3) {

					// set message data
					task.setTaskId((name.toLowerCase() + "-" + params[0]).trim());
					task.setTaskName(name.toLowerCase());
					task.setCfgStart("not-set");
					task.setCfgGoal(params[0].trim());
					task.setRiskLevel(Float.parseFloat("0.0"));

				} else {

					// set message data
					task.setTaskId((name.toLowerCase() + params[1]).trim());
					task.setTaskName(name.toLowerCase());
					task.setCfgStart(params[0]);
					task.setCfgGoal(params[1]);
					task.setRiskLevel(Float.parseFloat(params[2]));
				}

				// add task
				task.setExpectedTime((next.getDuration()[1] - next.getDuration()[0]) / 2);
				task.setHumanTasks(new ArrayList<String>());
				tasks.add(task);
			}
		}

		// check tasks
		if (tasks.size() == 1) {

			// set empty object
			sharework_taskplanner_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
					newFromType(sharework_taskplanner_msgs.MotionTaskExecutionRequest._TYPE);
			// add task
			tasks.add(task);

			// set empty object
			task = node.getTopicMessageFactory().
					newFromType(sharework_taskplanner_msgs.MotionTaskExecutionRequest._TYPE);
			// add task
			tasks.add(task);

		} else if (tasks.size() == 2) {

			// set empty object
			sharework_taskplanner_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
					newFromType(sharework_taskplanner_msgs.MotionTaskExecutionRequest._TYPE);
			// add task
			tasks.add(task);

		} else {
			// nothing to do
		}
		
		// set request tasks
		request.setTasks(tasks);
		// get the request
		return request;
	}

}
