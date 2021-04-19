package com.github.sharework_taskplanner.taskplanner;

import it.cnr.istc.pst.platinum.ai.executive.Executive;
import it.cnr.istc.pst.platinum.ai.executive.dispatcher.ConditionCheckingDispatcher;
import it.cnr.istc.pst.platinum.ai.executive.monitor.ConditionCheckingMonitor;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.FrameworkLoggerConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.executive.DispatcherConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.microkernel.annotation.cfg.executive.MonitorConfiguration;
import it.cnr.istc.pst.platinum.ai.framework.utils.log.FrameworkLoggingLevel;

@FrameworkLoggerConfiguration(
        level = FrameworkLoggingLevel.INFO
)
@MonitorConfiguration(
        monitor = ConditionCheckingMonitor.class
)
@DispatcherConfiguration(
        dispatcher = ConditionCheckingDispatcher.class
)
public class ShareworkExecutive extends Executive {

    /**
     *
     */
    protected ShareworkExecutive() {
        super();
    }
}
