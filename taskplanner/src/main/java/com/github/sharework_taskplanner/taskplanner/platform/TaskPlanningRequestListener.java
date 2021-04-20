package com.github.sharework_taskplanner.taskplanner.platform;

import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaGoalListener;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.RosJavaPlatformProxy;
import com.github.roxanne_rosjava.roxanne_rosjava_core.control.platform.ex.MessageUnmarshalingException;
import it.cnr.istc.pst.platinum.control.lang.AgentTaskDescription;
import it.cnr.istc.pst.platinum.control.lang.TokenDescription;
import java.util.concurrent.atomic.AtomicLong;

/**
 *
 */
public class TaskPlanningRequestListener extends RosJavaGoalListener<task_planner_interface_msgs.TaskPlanningRequest>
{
    private static final AtomicLong taskCounter = new AtomicLong(0);

    /**
     *
     * @param proxy
     */
    protected TaskPlanningRequestListener(RosJavaPlatformProxy proxy) {
       super(proxy);
    }

    /**
     *
     * @return
     */
   // @Override
    public String getMessageType() {
        return task_planner_interface_msgs.TaskPlanningRequest._TYPE;
    }

    /**
     *
     * @param msg
     * @return
     * @throws MessageUnmarshalingException
     */
    @Override
    public AgentTaskDescription unmarshal(task_planner_interface_msgs.TaskPlanningRequest msg)
            throws MessageUnmarshalingException {

        // request goal component
        String component = msg.getComponent();
        // requested process goal
        String goal = msg.getGoal();
        // check message data
        if (goal == null || goal.equals("") || component == null || component.equals("")) {
            // mandatory parameter missing
            throw new MessageUnmarshalingException("Received an invalid task request: \"" + msg + "\"\n" +
                    "No goal has been specified");
        }

        // check start bound
        long[] start = new long[] {
                0,
                100
        };

        // check request
        if (msg.getStart() != null && msg.getStart().length >= 2) {
            start = msg.getStart();
        }

        // check end bound
        long[] end = new long[] {
                0,
                100
        };

        // check request
        if (msg.getEnd() != null && msg.getEnd().length >= 2) {
            end = msg.getEnd();
        }

        // check duration bound
        long[] duration = new long[] {
                1,
                100
        };

        // check request
        if (msg.getDuration() != null && msg.getDuration().length >= 2) {
            duration = msg.getDuration();
        }

        // received input goal
        log.info("Received a task to plan for: \"" + msg + "\"\n");
        // prepare a task description
        AgentTaskDescription task = new AgentTaskDescription(taskCounter.getAndIncrement());
        // add goal description
        task.addGoalDescription(new TokenDescription(
                component,
                goal,
                null,
                start,
                end,
                duration));

        // get task request description
        return task;
    }
}
