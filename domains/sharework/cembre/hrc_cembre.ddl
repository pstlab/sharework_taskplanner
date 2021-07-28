DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	COMP_TYPE SingletonStateVariable GoalVariableType(cembre_goal(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			cembre_goal();
		}

		VALUE cembre_goal() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_MoveLockingBracket(), _StoreCompletePiece(), _SizeButtonHolesCheck(), _Unscrew1(), _SmoothCheck(), _WithdrawCompletePiece(), _HolesDimaeterCheck(), _CleanSurface(), _LocationHolesCheck(), _InitialCheck(), _Screw(), _MoveLockingBracket(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_MoveLockingBracket();
			_StoreCompletePiece();
			_SizeButtonHolesCheck();
			_Unscrew1();
			_SmoothCheck();
			_WithdrawCompletePiece();
			_HolesDimaeterCheck();
			_CleanSurface();
			_LocationHolesCheck();
			_InitialCheck();
			_Screw();
			_MoveLockingBracket();
		}

		VALUE _MoveLockingBracket() [7, 15]
		MEETS {
			Idle();
		}

		VALUE _StoreCompletePiece() [10, 14]
		MEETS {
			Idle();
		}

		VALUE _SizeButtonHolesCheck() [8, 14]
		MEETS {
			Idle();
		}

		VALUE _Unscrew1() [2, 8]
		MEETS {
			Idle();
		}

		VALUE _SmoothCheck() [9, 15]
		MEETS {
			Idle();
		}

		VALUE _WithdrawCompletePiece() [7, 15]
		MEETS {
			Idle();
		}

		VALUE _HolesDimaeterCheck() [7, 13]
		MEETS {
			Idle();
		}

		VALUE _CleanSurface() [4, 10]
		MEETS {
			Idle();
		}

		VALUE _LocationHolesCheck() [4, 10]
		MEETS {
			Idle();
		}

		VALUE _InitialCheck() [6, 16]
		MEETS {
			Idle();
		}

		VALUE _Screw() [8, 14]
		MEETS {
			Idle();
		}

		VALUE _MoveLockingBracket() [4, 10]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_WithdrawBlankPiece(), _PlaceBlank(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_WithdrawBlankPiece();
			_PlaceBlank();
		}

		VALUE _WithdrawBlankPiece() [1, 20]
		MEETS {
			Idle();
		}

		VALUE _PlaceBlank() [1, 20]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(doCembreAssembly(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCembreAssembly();
		}

		VALUE doCembreAssembly() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(doTask10(), doTask11(), doTask0(), doTask9(), doTask2(), doTask1(), doTask4(), doTask3(), doTask6(), doTask5(), doTask12(), doTask8(), doTask7(), doTask13(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doTask10();
			doTask11();
			doTask0();
			doTask9();
			doTask2();
			doTask1();
			doTask4();
			doTask3();
			doTask6();
			doTask5();
			doTask12();
			doTask8();
			doTask7();
			doTask13();
		}

		VALUE doTask10() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask11() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask0() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask9() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask6() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask12() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask8() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask7() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doTask13() [1, + INF]
		MEETS {
			Idle();
		}

	}


	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerVariableType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : CobotVariableType;
	COMPONENT ProductionL0 {FLEXIBLE tasks_l0(functional)} : ProductionHierarchyL0Type;
	COMPONENT ProductionL1 {FLEXIBLE tasks_l1(functional)} : ProductionHierarchyL1Type;

	SYNCHRONIZE ProductionL0.tasks_l0 {

		 VALUE doCembreAssembly() {

			d0 ProductionL1.tasks_l1.doTask10();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 ProductionL1.tasks_l1.doTask11();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 ProductionL1.tasks_l1.doTask0();
	            	CONTAINS [0, +INF] [0, +INF] d2;

	            d3 ProductionL1.tasks_l1.doTask9();
        	    CONTAINS [0, +INF] [0, +INF] d3;

	            d4 ProductionL1.tasks_l1.doTask2();
        	    CONTAINS [0, +INF] [0, +INF] d4;

	            d5 ProductionL1.tasks_l1.doTask1();
        	    CONTAINS [0, +INF] [0, +INF] d5;

	            d6 ProductionL1.tasks_l1.doTask4();
        	    CONTAINS [0, +INF] [0, +INF] d6;

	            d7 ProductionL1.tasks_l1.doTask3();
        	    CONTAINS [0, +INF] [0, +INF] d7;

	           d8 ProductionL1.tasks_l1.doTask6();
        	   CONTAINS [0, +INF] [0, +INF] d8;

	           d9 ProductionL1.tasks_l1.doTask5();
        	   CONTAINS [0, +INF] [0, +INF] d9;

	           d10 ProductionL1.tasks_l1.doTask12();
        	   CONTAINS [0, +INF] [0, +INF] d10;

	           d11 ProductionL1.tasks_l1.doTask8();
        	   CONTAINS [0, +INF] [0, +INF] d11;

	           d12 ProductionL1.tasks_l1.doTask7();
        	   CONTAINS [0, +INF] [0, +INF] d12;
            	
		  d13 ProductionL1.tasks_l1.doTask13();
	          CONTAINS [0, +INF] [0, +INF] d13;

		d2 BEFORE [0, +INF] d5;
		d5 BEFORE [0, +INF] d4;
		d4 BEFORE [0, +INF] d7;
		d7 BEFORE [0, +INF] d6;
		d6 BEFORE [0, +INF] d9;
		d9 BEFORE [0, +INF] d8;
		d8 BEFORE [0, +INF] d12;
		d12 BEFORE [0, +INF] d11;
		d11 BEFORE [0, +INF] d3;
		d3 BEFORE [0, +INF] d1;
		d0 BEFORE [0, +INF] d1;
		d1 BEFORE [0, +inf] d10;
		d10 BEFORE [0, +INF] d13;

		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		VALUE doTask10() {

			d0 Cobot.tasks._WithdrawBlankPiece();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask0() {

			d0 Worker.operations._InitialCheck();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask2() {

			d0 Worker.operations._LocationHolesCheck();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask4() {

			d0 Worker.operations._SmoothCheck();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask6() {

			d0 Worker.operations._MoveLockingBracket();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask8() {

			d0 Worker.operations._StoreCompletePiece();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask13() {

			d0 Worker.operations._Screw();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask11() {

			d0 Cobot.tasks._PlaceBlank();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask9() {

			d0 Worker.operations._CleanSurface();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask1() {

			d0 Worker.operations._HolesDimaeterCheck();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask3() {

			d0 Worker.operations._SizeButtonHolesCheck();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask5() {

			d0 Worker.operations._Unscrew1();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask12() {

			d0 Worker.operations._MoveLockingBracket();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE doTask7() {

			d0 Worker.operations._WithdrawCompletePiece();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}

	SYNCHRONIZE Goal.goals {

		VALUE cembre_goal() {

			d0 ProductionL0.tasks_l0.doCembreAssembly();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

	}


}

