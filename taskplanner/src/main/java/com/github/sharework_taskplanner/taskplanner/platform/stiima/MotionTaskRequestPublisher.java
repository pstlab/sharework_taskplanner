package com.github.sharework_taskplanner.taskplanner.platform.stiima;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaCommandPublisher;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageMarshalingException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import it.cnr.istc.pst.platinum.ai.executive.pdb.ExecutionNode;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.FrameworkObject;
import it.cnr.istc.pst.platinum.ai.framework.utils.properties.FilePropertyReader;
import it.cnr.istc.pst.platinum.control.lang.PlatformCommand;
import it.cnr.istc.pst.platinum.control.platform.PlatformProxy;
import org.bson.Document;
import org.ros.node.ConnectedNode;

import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 *
 */
public class MotionTaskRequestPublisher extends RosJavaCommandPublisher<task_planner_interface_msgs.MotionTaskExecutionRequestArray> {

	private MongoClient client;
	private MongoCollection<Document> collection;

	/**
	 *
	 * @param proxy
	 */
	protected MotionTaskRequestPublisher(RosJavaPlatformProxy proxy) {
		super(proxy);
		FilePropertyReader reader = new FilePropertyReader(System.getenv("PLATINUM_HOME") + "/etc/deliberative.properties");
		// connect to mongo
		this.client = MongoClients.create(reader.getProperty("mongodb_host"));
		MongoDatabase db = this.client.getDatabase("sharework");
		this.collection = db.getCollection("hrc_task_properties");
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
			throws MessageMarshalingException {

		// create message
		task_planner_interface_msgs.MotionTaskExecutionRequestArray request = node.getTopicMessageFactory()
				.newFromType(task_planner_interface_msgs.MotionTaskExecutionRequestArray._TYPE);

		// set data
		request.setCmdId(cmd.getId());
		// prepare the list of tasks
		List<task_planner_interface_msgs.MotionTaskExecutionRequest> tasks = new ArrayList<>();

		// create data message
		task_planner_interface_msgs.MotionTaskExecutionRequest task = node.getTopicMessageFactory().
				newFromType(task_planner_interface_msgs.MotionTaskExecutionRequest._TYPE);

		// set task id
		String taskId = cmd.getName().replace("_", "").trim();
		// check parameters
		if (cmd.getParamValues() != null && cmd.getParamValues().length > 0) {
			for (String param : cmd.getParamValues()) {
				// concat parameters
				taskId += "-" + param.toLowerCase();
			}
		}

		// print message
		this.log.info("[MotionTaskRequestPublisher] Retrieving information about task \"" + taskId + "\":\n");

		// retrieve task properties from mongo
		Document doc = this.collection.find(Filters.eq("name", taskId)).first();
		if (doc == null) {
			// throw exception
			throw new MessageMarshalingException("Unknown task \"" + taskId + "\" to dispatch");
		}

		// set message data
		task.setTaskId(taskId);
		task.setTaskName(cmd.getName().toLowerCase());
		task.setCfgStart(doc.getString("target"));
		task.setCfgGoal(doc.getString("goal"));
		task.setTaskDescription(doc.getString("description"));
		task.setRiskLevel(0.0);
		// get average expected time
		task.setExpectedTime((cmd.getNode().getDuration()[1] - cmd.getNode().getDuration()[0]) / 2);
		task.setHumanTasks(new ArrayList<String>());
		// add task
		tasks.add(task);

		// check the next 2 nodes on the component (if any)
		ExecutionNode next = cmd.getNode().getNext();
		int counter = 0;
		while (next != null && counter < 2) { //&& !this.proxy.isPlatformCommand(next)) {

			// get next command	
			//next = next.getNext();
			// check if a command has been found
			//if (next != null && this.proxy.isPlatformCommand(next)) {
			if (this.proxy.isPlatformCommand(next)) {

				// increment counter
				counter++;
				// extract command name
				String name = PlatformProxy.extractCommandName(next);
				// get next command parameters
				String[] params = PlatformProxy.extractCommandParameters(next);

				// create new task data
				task = node.getTopicMessageFactory().
						newFromType(task_planner_interface_msgs.MotionTaskExecutionRequest._TYPE);

				// set task ID
				taskId = cmd.getName().replace("_", "").trim().toLowerCase();
				// check parameters
				if (cmd.getParamValues() != null && cmd.getParamValues().length > 0) {
					for (String param : cmd.getParamValues()) {
						// concat parameters
						taskId += "-" + param.toLowerCase();
					}
				}

				// retrieve task properties from mongo
				doc = this.collection.find(Filters.eq("name", taskId)).first();

				// set message data
				task.setTaskId(taskId);
				task.setTaskName(cmd.getName().toLowerCase());
				task.setCfgStart(doc.getString("target"));
				task.setCfgGoal(doc.getString("goal"));
				task.setTaskDescription(doc.getString("description"));
				task.setRiskLevel(0.0);
				// get average expected time
				task.setExpectedTime((cmd.getNode().getDuration()[1] - cmd.getNode().getDuration()[0]) / 2);
				task.setHumanTasks(new ArrayList<String>());
				// add task
				tasks.add(task);
			}
		}

		// complete list of tasks if necessary
		while (tasks.size() < 3) {

			// add empty task to complete description
			task = node.getTopicMessageFactory().
					newFromType(task_planner_interface_msgs.MotionTaskExecutionRequest._TYPE);

			// add task
			tasks.add(task);
		}

		// set request tasks
		request.setTasks(tasks);


		// print message
		this.log.info("[MotionTaskRequestPublisher] Publishing command:\n" +
				"- cmd= " + cmd + "\n" +
				"- taskId= " + task.getTaskId() + "\n" +
				"- taskName= " + task.getTaskName() + "\n" +
				"- taskDescription= " + task.getTaskDescription() + "\n" +
				"- taskGoal= " + task.getCfgGoal() + "\n");


		// get the request
		return request;
	}

}
