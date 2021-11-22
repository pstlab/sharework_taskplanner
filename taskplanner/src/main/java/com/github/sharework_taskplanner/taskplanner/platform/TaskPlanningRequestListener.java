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
    @Override
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

        String[] parameters = new String[] {};
        if (msg.getParameters() != null && msg.getParameters().size() > 0) {
            // get array of parameters
            parameters = msg.getParameters().toArray(new String[msg.getParameters().size()]);
        }

        // prepare a task description
        AgentTaskDescription task = new AgentTaskDescription(taskCounter.getAndIncrement());
        // add goal description
        task.addGoalDescription(new TokenDescription(
                component,
                goal,
                parameters,
                new long[] {            // start
                        0,
                        1000
                },
                new long[] {            // end
                        0,
                        1000
                },
                new long[] {            // duration
                        1,
                        1000
                }));

        // add facts
        task.addFactDescription(new TokenDescription(
                "Cobot",
                "Idle",
                new String[] {},
                new long[] {0, 0},
                new long[] {1, 1000},
                new long[] {1, 1000}));


        // check GOIZPER goal
        if (goal.contains("screw-on-pose")) {

            // add additional facts
            log.info("Set facts for the GOIZPER scenario");
            // add fact
            task.addFactDescription(new TokenDescription(
                    "CobotMotion",
                    "At",
                    new String[]{"0"},
                    new long[]{0, 0},
                    new long[]{1, 1000},
                    new long[]{1, 1000}));

            // add fact
            task.addFactDescription(new TokenDescription(
                    "CobotScrewDriver",
                    "Idle",
                    new String[]{},
                    new long[]{0, 0},
                    new long[]{1, 1000},
                    new long[]{1, 1000}));
        }

        // get task request description
        return task;
    }
}
