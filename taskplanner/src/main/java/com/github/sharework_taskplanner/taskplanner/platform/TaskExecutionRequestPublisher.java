package com.github.sharework_taskplanner.taskplanner.platform;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaCommandPublisher;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageMarshalingException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import it.cnr.istc.pst.platinum.ai.executive.pdb.ExecutionNode;
import it.cnr.istc.pst.platinum.ai.framework.utils.properties.FilePropertyReader;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import it.cnr.istc.pst.platinum.control.platform.PlatformProxy;
import org.bson.Document;
import org.ros.node.ConnectedNode;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class TaskExecutionRequestPublisher extends RosJavaCommandPublisher<task_planner_interface_msgs.TaskExecutionRequest> {

	/**
	 *
	 * @param proxy
	 */
	protected TaskExecutionRequestPublisher(RosJavaPlatformProxy proxy) {
		super(proxy);
		FilePropertyReader reader = new FilePropertyReader(System.getenv("PLATINUM_HOME") + "/etc/deliberative.properties");
	}

	/**
	 *
	 * @return
	 */
	@Override
	public String getMessageType() {
		return task_planner_interface_msgs.TaskExecutionRequest._TYPE;
	}

	/**
	 *
	 * @param node
	 * @param cmd
	 * @return
	 * @throws MessageMarshalingException
	 */
	@Override
	public task_planner_interface_msgs.TaskExecutionRequest marshal(ConnectedNode node, PlatformCommand cmd)
			throws MessageMarshalingException {

		// create message
		task_planner_interface_msgs.TaskExecutionRequest request = node.getTopicMessageFactory()
				.newFromType(task_planner_interface_msgs.TaskExecutionRequest._TYPE);

		// set command ID
		request.setCmdId(cmd.getId());
		// set task name
		String taskName = cmd.getName().replace("_", "").trim();
		request.setTaskName(taskName);

		// check task parameters
		List<String> params = new ArrayList<>();
		if (cmd.getParamValues() != null && cmd.getParamValues().length > 0) {
			for (String par : cmd.getParamValues()) {
				params.add(par);
			}
		}

		// set task parameters
		request.setTaskParams(params);
		// set task description
		String taskDescription = cmd.getName().replace("_", "").trim();
		// check parameters
		if (cmd.getParamValues() != null && cmd.getParamValues().length > 0) {
			for (String param : cmd.getParamValues()) {
				// concat parameters
				taskDescription += "-" + param.trim();
			}
		}
		// set task description
		request.setTaskDescription(taskDescription);

		// print message
		this.log.info("[TaskExecutionRequestPublisher] Dispatching task execution request:\n" +
				"\t- Command ID: " + request.getCmdId() + "\n" +
				"\t- Task name: " + request.getTaskName() + "\n" +
				"\t- Task parameters: " + request.getTaskParams() + "\n" +
				"\t- Task description: " + request.getTaskDescription() + "\n");


		// get the request to be published through ROS topic
		return request;
	}

}
