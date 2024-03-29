DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

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

	COMP_TYPE SingletonStateVariable Position0Type (Free(), Busy()) {
		VALUE Free() [1, +INF]
		MEETS {
			Busy();
		}

		VALUE Busy() [1, +INF]
		MEETS {
			Free();
		}

	}

	COMP_TYPE SingletonStateVariable GoalVariableType(goal_1122(), goal_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			goal_1122();
			goal_0218();
		}

		VALUE goal_1122() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE goal_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_pickplace-p1-p3-0218(), _mount-p3-human(), _pickplace-p3-p4-human(), _pickplace-p3-rbox-human(), _pickplace-p2-p4-0218(), _pickplace-pbox-p3-0218(), _pickplace-pbox-p2-0218(), _unmount-p2-0218(), _unmount-p3-0218(), _pickplace-p3-rbox-0218(), _mount-p2-0218(), _pickplace-p1-p3-human(), _pickplace-p1-p2-0218(), _pickplace-p2-p4-human(), _pickplace-p2-rbox-human(), _pickplace-p3-p4-0218(), _pickplace-p2-rbox-0218(), _unmount-p3-human(), _mount-p2-human(), _mount-p3-0218(), _pickplace-p1-p2(), _pickplace-pbox-p3(), _unmount-p2-human(), _pickplace-pbox-p2-human(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_pickplace-p1-p3-0218();
			_mount-p3-human();
			_pickplace-p3-p4-human();
			_pickplace-p3-rbox-human();
			_pickplace-p2-p4-0218();
			_pickplace-pbox-p3-0218();
			_pickplace-pbox-p2-0218();
			_unmount-p2-0218();
			_unmount-p3-0218();
			_pickplace-p3-rbox-0218();
			_mount-p2-0218();
			_pickplace-p1-p3-human();
			_pickplace-p1-p2-0218();
			_pickplace-p2-p4-human();
			_pickplace-p2-rbox-human();
			_pickplace-p3-p4-0218();
			_pickplace-p2-rbox-0218();
			_unmount-p3-human();
			_mount-p2-human();
			_mount-p3-0218();
			_pickplace-p1-p2();
			_pickplace-pbox-p3();
			_unmount-p2-human();
			_pickplace-pbox-p2-human();
		}

		VALUE _pickplace-p1-p3-0218() [1, 1000]
		MEETS {
			Idle();
		}

		VALUE _mount-p3-human() [13, 33]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p3-p4-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p3-rbox-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p4-0218() [1, 1000]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p3-0218() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-0218() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-0218() [1, 123]
		MEETS {
			Idle();
		}

		VALUE _unmount-p3-0218() [1, 115]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p3-rbox-0218() [1, 115]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-0218() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p3-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p2-0218() [1, 1000]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-p4-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-human() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p3-p4-0218() [1, 1000]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p2-rbox-0218() [1, 112]
		MEETS {
			Idle();
		}

		VALUE _unmount-p3-human() [16, 40]
		MEETS {
			Idle();
		}

		VALUE _mount-p2-human() [5, 25]
		MEETS {
			Idle();
		}

		VALUE _mount-p3-0218() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-p1-p2() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p3() [1, 9]
		MEETS {
			Idle();
		}

		VALUE _unmount-p2-human() [5, 25]
		MEETS {
			Idle();
		}

		VALUE _pickplace-pbox-p2-human() [1, 9]
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

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L0Type(do_process(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process();
		}

		VALUE do_process() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L1Type(do_process_p3(), do_process_p2(),  Idle()) {

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

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L2Type(do_assembly_p3(), do_disassembly_p2(), do_assembly_p2(), do_disassembly_p3(),  Idle()) {

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

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L3Type(do_unmount_p2(), do_mount_p3(), do_place_p2(), do_finish_p3(), do_pick_p3(), do_release_p3(), do_unmount_p3(), do_place_p3(), do_mount_p2(), do_finish_p2(), do_pick_p2(), do_release_p2(),  Idle()) {

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

	COMP_TYPE SingletonStateVariable ProductionHierarchyG0L4Type(do_mount_p2_robot(), do_mount_p3_robot(), do_unmount_p3_robot(), do_release_p3_robot(), do_release_p2_robot(), do_release_p2_human(), do_release_p3_human(), do_unmount_p2_robot(), do_pick_p2_robot(), do_pick_p3_robot(), do_mount_p2_human(), do_pick_p2_human(), do_pick_p3_human(), do_mount_p3_human(), do_unmount_p2_human(), do_unmount_p3_human(),  Idle()) {

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


	COMPONENT Position3 {FLEXIBLE position3_state(primitive)} : Position3Type;
	COMPONENT Position2 {FLEXIBLE position2_state(primitive)} : Position2Type;
	COMPONENT Position1 {FLEXIBLE position1_state(primitive)} : Position1Type;
	COMPONENT Position0 {FLEXIBLE position0_state(primitive)} : Position0Type;
	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionG0L0 {FLEXIBLE tasks_g0_l0(functional)} : ProductionHierarchyG0L0Type;
	COMPONENT ProductionG0L1 {FLEXIBLE tasks_g0_l1(functional)} : ProductionHierarchyG0L1Type;
	COMPONENT ProductionG0L2 {FLEXIBLE tasks_g0_l2(functional)} : ProductionHierarchyG0L2Type;
	COMPONENT ProductionG0L3 {FLEXIBLE tasks_g0_l3(functional)} : ProductionHierarchyG0L3Type;
	COMPONENT ProductionG0L4 {FLEXIBLE tasks_g0_l4(functional)} : ProductionHierarchyG0L4Type;

	SYNCHRONIZE ProductionG0L4.tasks_g0_l4 {

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
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_human() {

			d0 Worker.operations._mount-p2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_human() {

			d0 Worker.operations._pickplace-pbox-p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
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
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_human() {

			d0 Worker.operations._pickplace-pbox-p2-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
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

	SYNCHRONIZE ProductionG0L3.tasks_g0_l3 {

		 VALUE do_unmount_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_unmount_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_unmount_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p2() {

			d0 Worker.operations._pickplace-p1-p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p3() {

			d0 Worker.operations._pickplace-p3-p4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		 VALUE do_pick_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_pick_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_pick_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_mount_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_mount_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_pick_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_pick_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_pick_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_release_p2_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p2() {

			d0 ProductionG0L4.tasks_g0_l4.do_release_p2_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_mount_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_mount_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_mount_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_release_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_release_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_release_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_unmount_p3_robot();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_unmount_p3() {

			d0 ProductionG0L4.tasks_g0_l4.do_unmount_p3_human();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_place_p3() {

			d0 Worker.operations._pickplace-p1-p3-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2() {

			d0 Worker.operations._pickplace-p2-p4-human();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

	}

	SYNCHRONIZE ProductionG0L1.tasks_g0_l1 {

		 VALUE do_process_p3() {

			d0 ProductionG0L2.tasks_g0_l2.do_assembly_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_disassembly_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_process_p2() {

			d0 ProductionG0L2.tasks_g0_l2.do_assembly_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L2.tasks_g0_l2.do_disassembly_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L2.tasks_g0_l2 {

		 VALUE do_disassembly_p2() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_place_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_release_p2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d2;
		}

		 VALUE do_disassembly_p3() {

			d0 ProductionG0L3.tasks_g0_l3.do_unmount_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_place_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_release_p3();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d2;
		}

		 VALUE do_assembly_p3() {

			d0 ProductionG0L3.tasks_g0_l3.do_finish_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_mount_p3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_pick_p3();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_assembly_p2() {

			d0 ProductionG0L3.tasks_g0_l3.do_finish_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG0L3.tasks_g0_l3.do_mount_p2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG0L3.tasks_g0_l3.do_pick_p2();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG0L0.tasks_g0_l0 {

		 VALUE do_process() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p3();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process() {

			d0 ProductionG0L1.tasks_g0_l1.do_process_p2();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_1122() {

			d0 ProductionG0L0.tasks_g0_l0.do_process();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L0Type(do_process_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_0218();
		}

		VALUE do_process_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L1Type(do_process_p2_0218(), do_process_p3_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_process_p2_0218();
			do_process_p3_0218();
		}

		VALUE do_process_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_process_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L2Type(do_assembly_p2_0218(), do_disassembly_p3_0218(), do_assembly_p3_0218(), do_disassembly_p2_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_assembly_p2_0218();
			do_disassembly_p3_0218();
			do_assembly_p3_0218();
			do_disassembly_p2_0218();
		}

		VALUE do_assembly_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_assembly_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_disassembly_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyG1L3Type(do_release_p3_0218(), do_finish_p2_0218(), do_finish_p3_0218(), do_pick_p2_0218(), do_place_p2_0218(), do_mount_p2_0218(), do_unmount_p3_0218(), do_mount_p3_0218(), do_unmount_p2_0218(), do_pick_p3_0218(), do_place_p3_0218(), do_release_p2_0218(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			do_release_p3_0218();
			do_finish_p2_0218();
			do_finish_p3_0218();
			do_pick_p2_0218();
			do_place_p2_0218();
			do_mount_p2_0218();
			do_unmount_p3_0218();
			do_mount_p3_0218();
			do_unmount_p2_0218();
			do_pick_p3_0218();
			do_place_p3_0218();
			do_release_p2_0218();
		}

		VALUE do_release_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_finish_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_mount_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_unmount_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_pick_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_place_p3_0218() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE do_release_p2_0218() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Position3 {FLEXIBLE position3_state(primitive)} : Position3Type;
	COMPONENT Position2 {FLEXIBLE position2_state(primitive)} : Position2Type;
	COMPONENT Position1 {FLEXIBLE position1_state(primitive)} : Position1Type;
	COMPONENT Position0 {FLEXIBLE position0_state(primitive)} : Position0Type;
	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionG0L0 {FLEXIBLE tasks_g0_l0(functional)} : ProductionHierarchyG0L0Type;
	COMPONENT ProductionG0L1 {FLEXIBLE tasks_g0_l1(functional)} : ProductionHierarchyG0L1Type;
	COMPONENT ProductionG0L2 {FLEXIBLE tasks_g0_l2(functional)} : ProductionHierarchyG0L2Type;
	COMPONENT ProductionG0L3 {FLEXIBLE tasks_g0_l3(functional)} : ProductionHierarchyG0L3Type;
	COMPONENT ProductionG0L4 {FLEXIBLE tasks_g0_l4(functional)} : ProductionHierarchyG0L4Type;
	COMPONENT ProductionG1L0 {FLEXIBLE tasks_g1_l0(functional)} : ProductionHierarchyG1L0Type;
	COMPONENT ProductionG1L1 {FLEXIBLE tasks_g1_l1(functional)} : ProductionHierarchyG1L1Type;
	COMPONENT ProductionG1L2 {FLEXIBLE tasks_g1_l2(functional)} : ProductionHierarchyG1L2Type;
	COMPONENT ProductionG1L3 {FLEXIBLE tasks_g1_l3(functional)} : ProductionHierarchyG1L3Type;

	SYNCHRONIZE ProductionG1L3.tasks_g1_l3 {

		VALUE do_release_p3_0218() {

			d0 Worker.operations._pickplace-p3-rbox-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_finish_p3_0218() {

			d0 Worker.operations._pickplace-p3-p4-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_pick_p2_0218() {

			d0 Worker.operations._pickplace-pbox-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p2_0218() {

			d0 Worker.operations._pickplace-p1-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position1.position1_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_mount_p2_0218() {

			d0 Worker.operations._mount-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_unmount_p2_0218() {

			d0 Worker.operations._unmount-p2-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_pick_p3_0218() {

			d0 Worker.operations._pickplace-pbox-p3-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_place_p3_0218() {

			d0 Worker.operations._pickplace-p1-p3-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position2.position2_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_finish_p2_0218() {

			d0 Worker.operations._pickplace-p2-p4-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Position3.position3_state.Busy();
			DURING [0, +INF] [0, +INF] d1;
		}

		VALUE do_unmount_p3_0218() {

			d0 Worker.operations._unmount-p3-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_mount_p3_0218() {

			d0 Worker.operations._mount-p3-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE do_release_p2_0218() {

			d0 Worker.operations._pickplace-p2-rbox-0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG1L0.tasks_g1_l0 {

		 VALUE do_process_0218() {

			d0 ProductionG1L1.tasks_g1_l1.do_process_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE do_process_0218() {

			d0 ProductionG1L1.tasks_g1_l1.do_process_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG1L2.tasks_g1_l2 {

		 VALUE do_assembly_p3_0218() {

			d0 ProductionG1L3.tasks_g1_l3.do_mount_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_pick_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_finish_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d0 BEFORE [0, +INF] d2;
			d1 BEFORE [0, +INF] d0;
		}

		 VALUE do_disassembly_p2_0218() {

			d0 ProductionG1L3.tasks_g1_l3.do_unmount_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_release_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_place_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d0;
			d0 BEFORE [0, +INF] d1;
		}

		 VALUE do_assembly_p2_0218() {

			d0 ProductionG1L3.tasks_g1_l3.do_finish_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_pick_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_mount_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d1 BEFORE [0, +INF] d2;
			d2 BEFORE [0, +INF] d0;
		}

		 VALUE do_disassembly_p3_0218() {

			d0 ProductionG1L3.tasks_g1_l3.do_release_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L3.tasks_g1_l3.do_place_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionG1L3.tasks_g1_l3.do_unmount_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d2;
			d2 BEFORE [0, +INF] d0;
			d1 BEFORE [0, +INF] d2;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE goal_0218() {

			d0 ProductionG1L0.tasks_g1_l0.do_process_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionG1L1.tasks_g1_l1 {

		 VALUE do_process_p3_0218() {

			d0 ProductionG1L2.tasks_g1_l2.do_disassembly_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L2.tasks_g1_l2.do_assembly_p3_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		 VALUE do_process_p2_0218() {

			d0 ProductionG1L2.tasks_g1_l2.do_assembly_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionG1L2.tasks_g1_l2.do_disassembly_p2_0218();
			CONTAINS [0, +INF] [0, +INF] d1;
			d1 BEFORE [0, +INF] d0;
		}

	}


}

