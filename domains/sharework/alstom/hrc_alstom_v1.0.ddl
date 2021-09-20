DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable GoalVariableType(window-frame-assembly(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			window-frame-assembly();
		}

		VALUE window-frame-assembly() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_InspectFrameCorner1(), _PlaceStructure01(), _PlaceStructure12(), _CleanFrameCorner1(), _SpreadSiliconeFrameCorner2(), _InsertRiverFrameCorner0(), _InspectFrameCorner2(), _CleanFrameCorner2(), _SpreadSiliconeFrameCorner3(), _InspectFrameCorner0(), _SpreadSiliconeFrameCorner1(), _CleanFrameCorner0(), _InsertRivetFrameCorner3(), _PlaceStructure23(), _SpreadSiliconeFrameCorner0(), _InsertRivetFrameCorner1(), _PlaceStructure30(), _CleanWindowFrame3(), _InspectFrameCorner3(), _InsertRivetFrameCorner2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_InspectFrameCorner1();
			_PlaceStructure01();
			_PlaceStructure12();
			_CleanFrameCorner1();
			_SpreadSiliconeFrameCorner2();
			_InsertRiverFrameCorner0();
			_InspectFrameCorner2();
			_CleanFrameCorner2();
			_SpreadSiliconeFrameCorner3();
			_InspectFrameCorner0();
			_SpreadSiliconeFrameCorner1();
			_CleanFrameCorner0();
			_InsertRivetFrameCorner3();
			_PlaceStructure23();
			_SpreadSiliconeFrameCorner0();
			_InsertRivetFrameCorner1();
			_PlaceStructure30();
			_CleanWindowFrame3();
			_InspectFrameCorner3();
			_InsertRivetFrameCorner2();
		}

		VALUE _InspectFrameCorner1() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _PlaceStructure01() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _PlaceStructure12() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _CleanFrameCorner1() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _SpreadSiliconeFrameCorner2() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _InsertRiverFrameCorner0() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _InspectFrameCorner2() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _CleanFrameCorner2() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _SpreadSiliconeFrameCorner3() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _InspectFrameCorner0() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _SpreadSiliconeFrameCorner1() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _CleanFrameCorner0() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _InsertRivetFrameCorner3() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _PlaceStructure23() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _SpreadSiliconeFrameCorner0() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _InsertRivetFrameCorner1() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _PlaceStructure30() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _CleanWindowFrame3() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _InspectFrameCorner3() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _InsertRivetFrameCorner2() [15, 25]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_RivetFrameCorner3(), _RivetFrameCorner2(), _ApplySiliconeFrameCorner3(), _ApplySiliconeFrameCorner1(), _ApplySiliconeFrameCorner2(), _ApplySiliconeFrameCorner0(), _RivetFrameCorner0(), _RivetFrameCorner1(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_RivetFrameCorner3();
			_RivetFrameCorner2();
			_ApplySiliconeFrameCorner3();
			_ApplySiliconeFrameCorner1();
			_ApplySiliconeFrameCorner2();
			_ApplySiliconeFrameCorner0();
			_RivetFrameCorner0();
			_RivetFrameCorner1();
		}

		VALUE _RivetFrameCorner3() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _RivetFrameCorner2() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ApplySiliconeFrameCorner3() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ApplySiliconeFrameCorner1() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ApplySiliconeFrameCorner2() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ApplySiliconeFrameCorner0() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _RivetFrameCorner0() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _RivetFrameCorner1() [15, 25]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(doWindowFrame(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doWindowFrame();
		}

		VALUE doWindowFrame() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(doFixCheckStructure3(), doFixCheckStructure1(), doCleanApplySilicone0(), doCleanApplySilicone2(), doPlaceStructure23(), doPlaceStructure01(), doPlaceStructure03(), doFixCheckStructure2(), doFixCheckStructure0(), doCleanApplySilicone3(), doCleanApplySilicone1(), doPlaceStructure12(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doFixCheckStructure3();
			doFixCheckStructure1();
			doCleanApplySilicone0();
			doCleanApplySilicone2();
			doPlaceStructure23();
			doPlaceStructure01();
			doPlaceStructure03();
			doFixCheckStructure2();
			doFixCheckStructure0();
			doCleanApplySilicone3();
			doCleanApplySilicone1();
			doPlaceStructure12();
		}

		VALUE doFixCheckStructure3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doFixCheckStructure1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanApplySilicone0() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanApplySilicone2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceStructure23() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceStructure01() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceStructure03() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doFixCheckStructure2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doFixCheckStructure0() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanApplySilicone3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanApplySilicone1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doPlaceStructure12() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL2Type(doCheckStructure0(), doCheckStructure2(), doApplySpreadSilicone3(), doApplySpreadSilicone1(), doFixStructure0(), doCleanSurface0(), doFixStructure2(), doCleanSurface2(), doCheckStructure1(), doCheckStructure3(), doApplySpreadSilicone0(), doFixStructure1(), doApplySpreadSilicone2(), doFixStructure3(), doCleanSurface1(), doCleanSurface3(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCheckStructure0();
			doCheckStructure2();
			doApplySpreadSilicone3();
			doApplySpreadSilicone1();
			doFixStructure0();
			doCleanSurface0();
			doFixStructure2();
			doCleanSurface2();
			doCheckStructure1();
			doCheckStructure3();
			doApplySpreadSilicone0();
			doFixStructure1();
			doApplySpreadSilicone2();
			doFixStructure3();
			doCleanSurface1();
			doCleanSurface3();
		}

		VALUE doCheckStructure0() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCheckStructure2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doApplySpreadSilicone3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doApplySpreadSilicone1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doFixStructure0() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanSurface0() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doFixStructure2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanSurface2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCheckStructure1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCheckStructure3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doApplySpreadSilicone0() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doFixStructure1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doApplySpreadSilicone2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doFixStructure3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanSurface1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCleanSurface3() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionL0 {FLEXIBLE tasks_l0(functional)} : ProductionHierarchyL0Type;
	COMPONENT ProductionL1 {FLEXIBLE tasks_l1(functional)} : ProductionHierarchyL1Type;
	COMPONENT ProductionL2 {FLEXIBLE tasks_l2(functional)} : ProductionHierarchyL2Type;

	SYNCHRONIZE ProductionL2.tasks_l2 {

		VALUE doCheckStructure2() {

			d0 Worker.operations._InspectFrameCorner2();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doApplySpreadSilicone1() {

			d0 Cobot.tasks._ApplySiliconeFrameCorner1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Worker.operations._SpreadSiliconeFrameCorner1();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doFixStructure2() {

			d1 Cobot.tasks._RivetFrameCorner2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d0 Worker.operations._InsertRivetFrameCorner2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doCleanSurface2() {

			d0 Worker.operations._CleanFrameCorner2();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCheckStructure3() {

			d0 Worker.operations._InspectFrameCorner3();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doApplySpreadSilicone0() {

			d0 Cobot.tasks._ApplySiliconeFrameCorner0();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Worker.operations._SpreadSiliconeFrameCorner0();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doFixStructure1() {

			d1 Cobot.tasks._RivetFrameCorner1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d0 Worker.operations._InsertRivetFrameCorner1();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doCleanSurface1() {

			d0 Worker.operations._CleanFrameCorner1();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCheckStructure0() {

			d0 Worker.operations._InspectFrameCorner0();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doApplySpreadSilicone3() {

			d0 Cobot.tasks._ApplySiliconeFrameCorner3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Worker.operations._SpreadSiliconeFrameCorner3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doFixStructure0() {

			d0 Worker.operations._InsertRiverFrameCorner0();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Cobot.tasks._RivetFrameCorner0();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doCleanSurface0() {

			d0 Worker.operations._CleanFrameCorner0();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doCheckStructure1() {

			d0 Worker.operations._InspectFrameCorner1();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doApplySpreadSilicone2() {

			d0 Cobot.tasks._ApplySiliconeFrameCorner2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Worker.operations._SpreadSiliconeFrameCorner2();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doFixStructure3() {

			d1 Cobot.tasks._RivetFrameCorner3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d0 Worker.operations._InsertRivetFrameCorner3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doCleanSurface3() {

			d0 Worker.operations._CleanWindowFrame3();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE ProductionL0.tasks_l0 {

		 VALUE doWindowFrame() {

			d0 ProductionL1.tasks_l1.doFixCheckStructure2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL1.tasks_l1.doFixCheckStructure3();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL1.tasks_l1.doFixCheckStructure0();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL1.tasks_l1.doFixCheckStructure1();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL1.tasks_l1.doPlaceStructure23();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL1.tasks_l1.doPlaceStructure01();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL1.tasks_l1.doPlaceStructure12();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL1.tasks_l1.doPlaceStructure03();
			CONTAINS [0, +INF] [0, +INF] d7;
			d8 ProductionL1.tasks_l1.doCleanApplySilicone3();
			CONTAINS [0, +INF] [0, +INF] d8;
			d9 ProductionL1.tasks_l1.doCleanApplySilicone0();
			CONTAINS [0, +INF] [0, +INF] d9;
			d10 ProductionL1.tasks_l1.doCleanApplySilicone2();
			CONTAINS [0, +INF] [0, +INF] d10;
			d11 ProductionL1.tasks_l1.doCleanApplySilicone1();
			CONTAINS [0, +INF] [0, +INF] d11;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		 VALUE doFixCheckStructure1() {

			d0 ProductionL2.tasks_l2.doCheckStructure1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doFixStructure1();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doCleanApplySilicone0() {

			d0 ProductionL2.tasks_l2.doApplySpreadSilicone0();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCleanSurface0();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		VALUE doPlaceStructure01() {

			d0 Worker.operations._PlaceStructure01();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doFixCheckStructure2() {

			d0 ProductionL2.tasks_l2.doCheckStructure2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doFixStructure2();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doCleanApplySilicone1() {

			d0 ProductionL2.tasks_l2.doApplySpreadSilicone1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCleanSurface1();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doFixCheckStructure3() {

			d0 ProductionL2.tasks_l2.doCheckStructure3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doFixStructure3();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doCleanApplySilicone2() {

			d0 ProductionL2.tasks_l2.doApplySpreadSilicone2();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCleanSurface2();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		VALUE doPlaceStructure23() {

			d0 Worker.operations._PlaceStructure23();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doPlaceStructure03() {

			d0 Worker.operations._PlaceStructure30();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		 VALUE doFixCheckStructure0() {

			d0 ProductionL2.tasks_l2.doCheckStructure0();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doFixStructure0();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		 VALUE doCleanApplySilicone3() {

			d0 ProductionL2.tasks_l2.doApplySpreadSilicone3();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL2.tasks_l2.doCleanSurface3();
			CONTAINS [0, +INF] [0, +INF] d1;
		}

		VALUE doPlaceStructure12() {

			d0 Worker.operations._PlaceStructure12();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE window-frame-assembly() {

			d0 ProductionL0.tasks_l0.doWindowFrame();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

