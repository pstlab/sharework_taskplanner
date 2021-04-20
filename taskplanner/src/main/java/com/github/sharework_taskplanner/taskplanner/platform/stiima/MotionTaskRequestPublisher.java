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
import java.util.Locale;

/**
 *
 */
public class MotionTaskRequestPublisher extends RosJavaCommandPublisher<task_planner_interface_msgs.MotionTaskExecutionRequestArray>
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
		return task_planner_interface_msgs.MotionTaskExecutionRequestArray._TYPE;
	}

	/**
	 *
	 * @param node
	 * @param cmd
	 * @return
	 * @throws MessageMarshalingException
	 */
	@Override
	public task_planner_interface_msgs.MotionTaskExecutionRequestArray marshal(ConnectedNode node, PlatformCommand cmd)
			throws MessageMarshalingException
	{
		// create message
		task_planner_interface_msgs.MotionTaskExecutionRequestArray request = node.getTopicMessageFactory()
				.newFromType(task_planner_interface_msgs.MotionTaskExecutionRequestArray._TYPE);
		// set data
		request.setCmdId(cmd.getId());
		// prepare the list of tasks
		List<task_planner_interface_msgs.MotionTaskExecutionRequest> tasks = new ArrayList<>();


		// check parameters
		if (cmd.getParamValues().length == 3)
		{
			// create data message
			task_planner_interface_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
					newFromType(task_planner_interface_msgs.MotionTaskExecutionRequest._TYPE);

			// set task id
			String taskId = cmd.getName().trim().toLowerCase() + cmd.getParamValues()[1].trim().replace("_", "-");
			// check type of task
			if (taskId.contains("place")) {
				taskId = taskId.replace("box-a", "box-A")
						.replace("box-b", "box-B");
			}

			// set message data
			task.setTaskId(taskId);
			task.setTaskName(cmd.getName().toLowerCase());
			task.setCfgStart(cmd.getParamValues()[0].trim());
			task.setCfgGoal(cmd.getParamValues()[1].trim());
			task.setRiskLevel(Float.parseFloat(cmd.getParamValues()[2].trim()));
			task.setExpectedTime((cmd.getNode().getDuration()[1] - cmd.getNode().getDuration()[0]) / 2);
			task.setHumanTasks(new ArrayList<String>());

			// add task
			tasks.add(task);
			// print message
			this.log.info("[MotionTaskRequestPublisher] Publishing command:\n" +
					"- cmd= " + cmd + "\n" +
					"- task-ID= " + task.getTaskId() + "\n");

		}
		else 
		{
			// create data message
			task_planner_interface_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
					newFromType(task_planner_interface_msgs.MotionTaskExecutionRequest._TYPE);

			// set task id
			String taskId = cmd.getName().trim().toLowerCase().replace("_", "-");
			// check type of task
			if (taskId.contains("place")) {
				taskId = taskId.replace("box-a", "box-A")
						.replace("box-b", "box-B");
			}

			// set message data
			task.setTaskId(taskId);
			task.setTaskName(cmd.getName().toLowerCase());
			task.setCfgStart("not-set");
			task.setCfgGoal("not-set");
			task.setRiskLevel(Float.parseFloat("0.0"));
			task.setExpectedTime((cmd.getNode().getDuration()[1] - cmd.getNode().getDuration()[0]) / 2);
			task.setHumanTasks(new ArrayList<String>());

			// add task
			tasks.add(task);
			// print message
			this.log.info("[MotionTaskRequestPublisher] Publishing command:\n" +
					"- cmd= " + cmd + "\n" +
					"- task-ID= " + task.getTaskId() + "\n");
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
				task_planner_interface_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
						newFromType(task_planner_interface_msgs.MotionTaskExecutionRequest._TYPE);

				// check parameters
				if (params.length == 3) {

					// set task id
					String taskId = cmd.getName().trim().toLowerCase() + cmd.getParamValues()[1].trim().replace("_", "-");
					// check type of task
					if (taskId.contains("place")) {
						taskId = taskId.replace("box-a", "box-A")
								.replace("box-b", "box-B");
					}

					// set message data
					task.setTaskId(taskId);
					task.setTaskName(cmd.getName().toLowerCase());
					task.setCfgStart(params[0].trim());
					task.setCfgGoal(params[1].trim());
					task.setRiskLevel(Float.parseFloat(params[2].trim()));

				} else {

					// set task id
					String taskId = cmd.getName().trim().toLowerCase().replace("_", "-");
					// check type of task
					if (taskId.contains("place")) {
						taskId = taskId.replace("box-a", "box-A")
								.replace("box-b", "box-B");
					}

					// set message data
					task.setTaskId(taskId);
					task.setTaskName(cmd.getName().toLowerCase().replace("_", "-"));
					task.setCfgStart("not-set");
					task.setCfgGoal("not-set");
					task.setRiskLevel(Float.parseFloat("0.0"));
				}

				// add task
				task.setExpectedTime((next.getDuration()[1] - next.getDuration()[0]) / 2);
				task.setHumanTasks(new ArrayList<String>());
				tasks.add(task);
			}
		}

		// check tasks
		while (tasks.size() < 3) {

			// add empty task to complete description
			task_planner_interface_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
					newFromType(task_planner_interface_msgs.MotionTaskExecutionRequest._TYPE);
			// add task
			tasks.add(task);
		}

		// set request tasks
		request.setTasks(tasks);
		// get the request
		return request;
	}

}
