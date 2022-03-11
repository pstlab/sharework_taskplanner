DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable Position4Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable Position3Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable Position2Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable Position1Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable GoalVariableType(goal(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			goal();
		}

		VALUE goal() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_mount-p3-human(), _pickplace-p3-rbox-human(), _pickplace-p3-p4-human(), _pickplace-pbox-p3(), _mount-p2-human(), _unmount-p3-human(), _pickplace-p2-rbox-human(), _pickplace-pbox-p2-human(), _unmount-p2-human(), _pickplace-p2-p4-human(), _pickplace-p1-p3-human(), _pickplace-p1-p2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_mount-p3-human();
			_pickplace-p3-rbox-human();
			_pickplace-p3-p4-human();
			_pickplace-pbox-p3();
			_mount-p2-human();
			_unmount-p3-human();
			_pickplace-p2-rbox-human();
			_pickplace-pbox-p2-human();
			_unmount-p2-human();
			_pickplace-p2-p4-human();
			_pickplace-p1-p3-human();
			_pickplace-p1-p2();
		}

		VALUE _mount-p3-human() [13, 33]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p3-rbox-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p3-p4-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p3() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-human() [5, 25]
		MEETS {
			Idle();
		}

		VALUE _unmount-p3-human() [16, 40]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-human() [5, 25]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p4-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p2() [1, 9]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_unmount-p2-robot(), _pickplace-pbox-p2-robot(), _pickplace-p2-rbox-robot(), _monut-p2-robot(), _pickplace-p3-rbox-robot(), _pickplace-pbox-p3-robot(), _mount-p3-robot(), _unmount-p3-robot(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_unmount-p2-robot();
			_pickplace-pbox-p2-robot();
			_pickplace-p2-rbox-robot();
			_monut-p2-robot();
			_pickplace-p3-rbox-robot();
			_pickplace-pbox-p3-robot();
			_mount-p3-robot();
			_unmount-p3-robot();
		}

		VALUE _unmount-p2-robot() [18, 28]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-robot() [15, 21]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-robot() [8, 12]
		MEETS {
			Idle();
		}

		VALUE _monut-p2-robot() [20, 26]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p3-rbox-robot() [15, 21]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p3-robot() [15, 21]
		MEETS {
			Idle();
		}

		VALUE _mount-p3-robot() [15, 21]
		MEETS {
			Idle();
		}

		VALUE _unmount-p3-robot() [20, 26]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(do_process(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process();
		}

		VALUE do_process() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(do_process_p3(), do_process_p2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p3();
			do_process_p2();
		}

		VALUE do_process_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p2() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL2Type(do_assembly_p3(), do_disassembly_p2(), do_assembly_p2(), do_disassembly_p3(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_assembly_p3();
			do_disassembly_p2();
			do_assembly_p2();
			do_disassembly_p3();
		}

		VALUE do_assembly_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_assembly_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p3() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL3Type(do_unmount_p2(), do_mount_p3(), do_place_p2(), do_finish_p3(), do_pick_p3(), do_release_p3(), do_unmount_p3(), do_place_p3(), do_mount_p2(), do_finish_p2(), do_pick_p2(), do_release_p2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_unmount_p2();
			do_mount_p3();
			do_place_p2();
			do_finish_p3();
			do_pick_p3();
			do_release_p3();
			do_unmount_p3();
			do_place_p3();
			do_mount_p2();
			do_finish_p2();
			do_pick_p2();
			do_release_p2();
		}

		VALUE do_unmount_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL4Type(do_mount_p2_robot(), do_mount_p3_robot(), do_unmount_p3_robot(), do_release_p3_robot(), do_release_p2_robot(), do_release_p2_human(), do_release_p3_human(), do_unmount_p2_robot(), do_pick_p2_robot(), do_pick_p3_robot(), do_mount_p2_human(), do_pick_p2_human(), do_pick_p3_human(), do_mount_p3_human(), do_unmount_p2_human(), do_unmount_p3_human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_mount_p2_robot();
			do_mount_p3_robot();
			do_unmount_p3_robot();
			do_release_p3_robot();
			do_release_p2_robot();
			do_release_p2_human();
			do_release_p3_human();
			do_unmount_p2_robot();
			do_pick_p2_robot();
			do_pick_p3_robot();
			do_mount_p2_human();
			do_pick_p2_human();
			do_pick_p3_human();
			do_mount_p3_human();
			do_unmount_p2_human();
			do_unmount_p3_human();
		}

		VALUE do_mount_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p3_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3_robot() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p3_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_human() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3_human() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Position4 {FLEXIBLE position4_state(primitive)} : Position4Type;
	COMPONENT Position3 {FLEXIBLE position3_state(primitive)} : Position3Type;
	COMPONENT Position2 {FLEXIBLE position2_state(primitive)} : Position2Type;
	COMPONENT Position1 {FLEXIBLE position1_state(primitive)} : Position1Type;
	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionL0 {FLEXIBLE tasks_l0(primitive)} : ProductionHierarchyL0Type;
	COMPONENT ProductionL1 {FLEXIBLE tasks_l1(primitive)} : ProductionHierarchyL1Type;
	COMPONENT ProductionL2 {FLEXIBLE tasks_l2(primitive)} : ProductionHierarchyL2Type;
	COMPONENT ProductionL3 {FLEXIBLE tasks_l3(primitive)} : ProductionHierarchyL3Type;
	COMPONENT ProductionL4 {FLEXIBLE tasks_l4(primitive)} : ProductionHierarchyL4Type;

	SYNCHRONIZE ProductionL4.tasks_l4 {

		VALUE do_mount_p2_robot() {

			d0 Cobot.tasks._monut-p2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p3_robot() {

			d0 Cobot.tasks._unmount-p3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_mount_p3_robot() {

			d0 Cobot.tasks._mount-p3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p3_robot() {

			d0 Cobot.tasks._pickplace-p3-rbox-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p2_robot() {

			d0 Cobot.tasks._pickplace-p2-rbox-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p2_robot() {

			d0 Cobot.tasks._unmount-p2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_robot() {

			d0 Cobot.tasks._pickplace-pbox-p3-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_human() {

			d0 Worker.operations._mount-p2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_human() {

			d0 Worker.operations._pickplace-pbox-p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p2_human() {

			d0 Worker.operations._unmount-p2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p2_human() {

			d0 Worker.operations._pickplace-p2-rbox-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p3_human() {

			d0 Worker.operations._pickplace-p3-rbox-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p2_robot() {

			d0 Cobot.tasks._pickplace-pbox-p2-robot();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_human() {

			d0 Worker.operations._pickplace-pbox-p2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p3_human() {

			d0 Worker.operations._mount-p3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p3_human() {

			d0 Worker.operations._unmount-p3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL2.tasks_l2 {

		 VALUE do_disassembly_p2() {

			d0 ProductionL3.tasks_l3.do_unmount_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.do_place_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL3.tasks_l3.do_release_p2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d2;
		}

		 VALUE do_disassembly_p3() {

			d0 ProductionL3.tasks_l3.do_unmount_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.do_place_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL3.tasks_l3.do_release_p3();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d2;
		}

		 VALUE do_assembly_p3() {

			d0 ProductionL3.tasks_l3.do_finish_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.do_mount_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL3.tasks_l3.do_pick_p3();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_assembly_p2() {

			d0 ProductionL3.tasks_l3.do_finish_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL3.tasks_l3.do_mount_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL3.tasks_l3.do_pick_p2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL0.tasks_l0 {

		 VALUE do_process() {

			d0 ProductionL1.tasks_l1.do_process_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process() {

			d0 ProductionL1.tasks_l1.do_process_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL3.tasks_l3 {

		 VALUE do_unmount_p2() {

			d0 ProductionL4.tasks_l4.do_unmount_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p2() {

			d0 ProductionL4.tasks_l4.do_unmount_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p2() {

			d0 Worker.operations._pickplace-p1-p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p3() {

			d0 Worker.operations._pickplace-p3-p4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position4.position4_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_pick_p3() {

			d0 ProductionL4.tasks_l4.do_pick_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p3() {

			d0 ProductionL4.tasks_l4.do_pick_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p2() {

			d0 ProductionL4.tasks_l4.do_mount_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p2() {

			d0 ProductionL4.tasks_l4.do_mount_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p2() {

			d0 ProductionL4.tasks_l4.do_pick_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p2() {

			d0 ProductionL4.tasks_l4.do_pick_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p2() {

			d0 ProductionL4.tasks_l4.do_release_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p2() {

			d0 ProductionL4.tasks_l4.do_release_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p3() {

			d0 ProductionL4.tasks_l4.do_mount_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p3() {

			d0 ProductionL4.tasks_l4.do_mount_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p3() {

			d0 ProductionL4.tasks_l4.do_release_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p3() {

			d0 ProductionL4.tasks_l4.do_release_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p3() {

			d0 ProductionL4.tasks_l4.do_unmount_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p3() {

			d0 ProductionL4.tasks_l4.do_unmount_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p3() {

			d0 Worker.operations._pickplace-p1-p3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2() {

			d0 Worker.operations._pickplace-p2-p4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position4.position4_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		 VALUE do_process_p3() {

			d0 ProductionL2.tasks_l2.do_assembly_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.do_disassembly_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_process_p2() {

			d0 ProductionL2.tasks_l2.do_assembly_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.do_disassembly_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal() {

			d0 ProductionL0.tasks_l0.do_process();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

