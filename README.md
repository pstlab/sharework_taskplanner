# Task Planning Module for Sharework

This repository contains a **ROSjava package** enriching **ROS** with **task planning and execution services**. The module has been specifically 
designed for **Human-Robot Collaboration** with the objective of synthesizing flexible and reliable collaboration through timeline-based planning 
technologies [1].

## Installation

The package has been developed and tested for **ROS Melodic** distribution on **Ubunut 18.04**. It requires a ROSJava workspace for correct 
execution and generation of the Java artifacts needed for custom messages and installed Java software.

_We recommend the use of Java 8 since other higher or lower versions of Java may have some dependency issues with rosjava. Alternative 
versions of Java can be installed using the following command:_ 

```sudo update-alternatives --config java```

In addition, the package requires an installed locally running instance of **MongoDB server** (the current package has been 
developed and tested using [_MongDB Cumminuty Server v.4.4.5_](https://www.mongodb.com/try/download/community)). 

### ROSJava Workspace Configuration

Create an empty workspace.

```
mkdir -p ~/ws/src
cd ~/ws
catkin_make
```

Here are the instructions for downloading and building **ROSJava from source** (recommended). Please refer to the official 
[ROSJava Wiki](http://wiki.ros.org/rosjava) for further details about installation and availabe distributions.

```
wstool init -j4 ~/ws/src https://raw.githubusercontent.com/rosjava/rosjava/kinetic/rosjava.rosinstall
source /opt/ros/melodic/setup.bash
cd ~/ws
rosdep update
rosdep install --from-paths src -i -y
catkin_make
```

Note that one of the dependecies of **rosjava_messages** package is [world_canvas_msgs](http://wiki.ros.org/world_canvas_msgs) 
which is not supported by ROS Melodic. To successfully build **rosjava** thus remove this dependency by editing the file 
```package.xml``` of ```rosjava_messages``` and commenting the following line

```
<build_depend>world_canvas_msgs</build_depend>
```

### ROXANNE Installation

Planning and execution capabilities of the module relies on [**ROXANNE**](https://github.com/pstlab/roxanne_rosjava) which is an 
open-source package enriching ROS with timeline-based planning and execution functionalities [1]. ROXANNE specifically encapsulates
the [**PLATINUm**](https://github.com/pstlab/PLATINUm) framework [2] which has been successfully applied in Human-Robot Collaboration 
scenarios [3,4]. 

ROXANNE is a available as ROSJava package and can be easily installed by cloning the repository into the prepared ROSJava workspace. Clone the **roxanne_rosjava_msgs package** into the workspace in order to define the **custom messages** necessary to interact with a generic ROXANNE **acting node**.

```
cd ~/ws/src
git clone https://github.com/pstlab/roxanne_rosjava_msgs.git
cd ..
catkin_make
source devel/setup.bash
```

Install the **ROXANNE framework** by cloning into the workspace in order to "install" core software library that can be extended to realize 
specific (timeline-based) planning and execution instances as well as instantiate the generic **ROXANNE acting node**.

```
cd ~/ws/src
git clone https://github.com/pstlab/roxanne_rosjava.git
cd ..
catkin_make
source devel/setup.bash
```
To corectly install **ROXANNE** it is necessary to configure **gradle** with a **github personal access token** in order to download the last version of PLATINum that is available as Github package. Create a file ```gradle.properties``` into ```roxanne_rosjava``` with the following attributes:

```
gpr.user=<github-user>
gpr.token=<github-personal-access-token>
```

Refer to the [ROXANNE repository](https://github.com/pstlab/roxanne_rosjava) for further details and examples of usage to check the correct installation.

### Package Preparation 

Once that a **ROSJava workspace** has been successfully configured and that **ROXANNE** has been correctly installed everything 
is ready for the installation of the **sharework_taskplanner package**. 

First, it is necessary to install the package **task_planner_interface_msgs** defining custom messages and services that allow the task planner to correctly interact with other Sharework modules. This package is available on GitHub (https://github.com/pstlab/task_planner_interface_msgs.git) and can be installed into the workspace through the following commands:

```
cd ~/ws/src
git clone https://github.com/pstlab/task_planner_interface_msgs.git
cd ~/ws
catkin_make
source devel/setup.bash
```

It is possible to verify the successful built of the package by checking defined custom messages service through ```rosmsg show```. For example the following commands

```
cd ~/ws
source devel/setup.bash
rosmsg show task_planner_interface_msgs/TaskPlanningRequest
```
should give the following output which describes the message used to send task planning request to the module throug the topic ```sharework/taskplanner/goal```.

```
int64 requestId
string component
string goal
int64[] start
int64[] end
int64[] duration
```

### Bulding the Package

At this point install the **sharework_taskplanner package** into the ROSJava workspace by cloning and installing the current repository.

```
cd ~/ws/src
git clone https://github.com/pstlab/sharework_taskplanner.git
cd ..
source devel/setup.bash
catkin_make
source devel/setup.bash
```
As done for ROXANNE, create a file ```gradle.properties``` into ```sharework_taskplanner``` with the GitHub personal access token.

```
gpr.user=<github-user>
gpr.token=<github-personal-access-token>
````

To finalize the installation then define the environment variable **PLATINUM_HOME** in order to point to the folder containing the installed package. Since ROXANNE encapsulate PLATINUm as core timeline-based representation and solving engine, this variable is necessary to tell the framework where configuration files would be found (see the files under the ```etc``` folder of the package).
 
```
export SHAREWORK_WS=<path-to-the-workspace>
export PLATINUM_HOME=$SHAREWORK_WS/src/sharework_taskplanner
```

The above line of code can be added to the ```.bashrc``` file to automatically export the environment variable when the terminal is open. 

**IMPORTANT: Carefully check the files ```agent*.properties``` under the folder ```etc``` and verify the correctness of specified paths with respect to your filesystem**

## Package Usage 

If the the installation and configuration of the **sharework_taskplanner** package has been successfully done then it should be possible to run the developed **goal-oriented acting node** into ROS.

First open a terminal and start core ROS nodes using ```roscore```. 

Then, open a different terminal and launch the acting node as follows:

```
cd ~/ws
source devel/setup.bash
rosrun sharework_taskplanner taskplanner com.github.sharework_taskplanner.taskplanner.acting.ActingNode
```

At this point the service is running and can be called to _load_ planning models and send _task planning requests_. As an example consider the following commands to be executed on a third terminal. The commands load one of the timeline-based models availabine under the folder ```domains/sharework``` of the package and send a task planning request through the input topic ```sharework/taskplanner/goal```.

```
cd ~/ws
source devel/setup.bash
rosservice call /sharework/taskplanner/configuration "configFilePath: '<absolute-path-to-workspace>/src/sharework_taskplanner/etc/agent_cembre.properties'"
```
Then, send a task planning and execution request as follows:
```
rostopic pub --once /sharework/taskplanner/goal task_planner_interface_msgs/TaskPlanningRequest "requestId: 0
component: 'Goal'
goal: 'cembre_goal'
parameters: []
start: [0, 1000]
end: [0, 1000]
duration: [1, 1000]" 
```

The frist call load the specified file properties to intialize the acting node with a timeline-based specification defined for one of the case studies of the project. This call uses the _ROXANNE configuration service_ ```ActingConfigurationService.srv``` to parametrize the information needed to start (domain independent) timeline-based planning and execution processes. _Please note that the file path specified into the "load request" should be absolute._ 

Once the acting node is correctly initialized the underlying goal-oriented process starts listening messages on the topic specified into the deployment file (see the file ```etc/platform/sharework/platform_cembre.xml``` as an example for the scenario CEMBRE). The second call thus publishes a task planning request on the input topic ```/sharework/taskplanner/goal``` to trigger the deliberative process and concretely synthesize and execute a collaborative plan.


_To correctly run the above example please check the file ```agent_cembre.properties``` and set vald paths for the attributes ```model``` and ```platform_config_file```._

## References 

[1] Cialdea Mayer, M., Orlandini, A., Umbrico, A. "Planning and execution with flexible timelines: a formal account". Acta Informatica. Volume 53. 2016. Pages 649–680.

[2] Umbrico A., Cesta A., Cialdea Mayer M., Orlandini A. "PLATINUm: A New Framework for Planning and Acting". In: Esposito F., Basili R., Ferilli S., Lisi F. (eds) AI*IA 2017 Advances in Artificial Intelligence. AI*IA 2017. Lecture Notes in Computer Science, Volume 10640. 2017.

[3] M. Faroni, Beschi M., Ghidini S., Pedrocchi N., Umbrico A., Orlandini A., Cesta A. "A Layered Control Approach to Human-Aware Task and Motion Planning for Human-Robot Collaboration". 29th IEEE International Conference on Robot and Human Interactive Communication (RO-MAN). 2020. Pages 1204-1210.

[4] Pellegrinelli S., Orlandini A., Pedrocchi N., Umbrico A., Tolio T. "Motion planning and scheduling for human and industrial-robot collaboration". CIRP Annals.
Volume 66, Issue 1. 2017. Pages 1-4.
