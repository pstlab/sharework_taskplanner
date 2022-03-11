DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 1000], 100;

	PAR_TYPE EnumerationParameterType holes = {h1, h2, h3, h4, h5, h6, h7, h8};

	COMP_TYPE SingletonStateVariable GoalVariableType(table-assembly-goal(), screw-goal(holes), Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			table-assembly-goal();
			screw-goal(?h);
		}

		VALUE table-assembly-goal() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE screw-goal(?h) [1, + INF]
        MEETS {
            Idle();
        }

	}

	COMP_TYPE SingletonStateVariable WorkerVariableType(_PickPlaceH8(), _PickPlaceH4(), _PickPlaceH3(), _PickPlaceH1(), _PickPlaceH2(), _PickPlaceH7(), _PickPlaceH5(), _PickPlaceH6(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_PickPlaceH8();
			_PickPlaceH4();
			_PickPlaceH3();
			_PickPlaceH1();
			_PickPlaceH2();
			_PickPlaceH7();
			_PickPlaceH5();
			_PickPlaceH6();
		}

		VALUE _PickPlaceH8() [5, 15]
		MEETS {
			Idle();
		}

		VALUE _PickPlaceH4() [5, 15]
		MEETS {
			Idle();
		}

		VALUE _PickPlaceH3() [5, 15]
		MEETS {
			Idle();
		}

		VALUE _PickPlaceH1() [5, 15]
		MEETS {
			Idle();
		}

		VALUE _PickPlaceH2() [5, 15]
		MEETS {
			Idle();
		}

		VALUE _PickPlaceH7() [5, 15]
		MEETS {
			Idle();
		}

		VALUE _PickPlaceH5() [5, 15]
		MEETS {
			Idle();
		}

		VALUE _PickPlaceH6() [5, 15]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable CobotVariableType(_AutonomousScrew(holes), _screwH7(), _ScrewH5(), _ScrewH3(), _ScrewH8(), _ScrewH1(), _ScrewH6(), _ScrewH4(), _ScrewH2(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			_screwH7();
			_ScrewH5();
			_ScrewH3();
			_ScrewH8();
			_ScrewH1();
			_ScrewH6();
			_ScrewH4();
			_ScrewH2();
			_AutonomousScrew(?h);
		}

		VALUE _AutonomousScrew(?h) [15, 25]
        MEETS {
            Idle();
        }

		VALUE _screwH7() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ScrewH5() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ScrewH3() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ScrewH8() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ScrewH1() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ScrewH6() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ScrewH4() [15, 25]
		MEETS {
			Idle();
		}

		VALUE _ScrewH2() [15, 25]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL0Type(doAutonomousScrew(holes), doRotaryTable(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doRotaryTable();
			doAutonomousScrew(?h);
		}

		VALUE doAutonomousScrew(?h) [1, + INF]
        MEETS {
            Idle();
        }

		VALUE doRotaryTable() [1, + INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionHierarchyL1Type(doCollaborativeScrewH7(), doCollaborativeScrewH8(), doCollaborativeScrewH1(), doCollaborativeScrewH2(), doCollaborativeScrewH3(), doCollaborativeScrewH4(), doCollaborativeScrewH5(), doCollaborativeScrewH6(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			doCollaborativeScrewH7();
			doCollaborativeScrewH8();
			doCollaborativeScrewH1();
			doCollaborativeScrewH2();
			doCollaborativeScrewH3();
			doCollaborativeScrewH4();
			doCollaborativeScrewH5();
			doCollaborativeScrewH6();
		}

		VALUE doCollaborativeScrewH7() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH8() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH1() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH2() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH3() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH4() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH5() [1, + INF]
		MEETS {
			Idle();
		}

		VALUE doCollaborativeScrewH6() [1, + INF]
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

		 VALUE doRotaryTable() {

			d0 ProductionL1.tasks_l1.doCollaborativeScrewH7();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 ProductionL1.tasks_l1.doCollaborativeScrewH8();
			CONTAINS [0, +INF] [0, +INF] d1;
			d2 ProductionL1.tasks_l1.doCollaborativeScrewH1();
			CONTAINS [0, +INF] [0, +INF] d2;
			d3 ProductionL1.tasks_l1.doCollaborativeScrewH2();
			CONTAINS [0, +INF] [0, +INF] d3;
			d4 ProductionL1.tasks_l1.doCollaborativeScrewH3();
			CONTAINS [0, +INF] [0, +INF] d4;
			d5 ProductionL1.tasks_l1.doCollaborativeScrewH4();
			CONTAINS [0, +INF] [0, +INF] d5;
			d6 ProductionL1.tasks_l1.doCollaborativeScrewH5();
			CONTAINS [0, +INF] [0, +INF] d6;
			d7 ProductionL1.tasks_l1.doCollaborativeScrewH6();
			CONTAINS [0, +INF] [0, +INF] d7;
		}

		VALUE doAutonomousScrew(?h) {


		    d0 Cobot.tasks._AutonomousScrew(?h0);

		    CONTAINS [0, +INF] [0, +INF] d0;

		    ?h0 = ?h;
		}

	}

	SYNCHRONIZE ProductionL1.tasks_l1 {

		VALUE doCollaborativeScrewH7() {

			d0 Worker.operations._PickPlaceH7();
			CONTAINS [0, +INF] [0, +INF] d0;
			d1 Cobot.tasks._screwH7();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doCollaborativeScrewH1() {

			d1 Cobot.tasks._ScrewH1();
			CONTAINS [0, +INF] [0, +INF] d0;
			d0 Worker.operations._PickPlaceH1();
			CONTAINS [0, +INF] [0, +INF] d1;
			d0 BEFORE [0, +INF] d1;
		}

		VALUE doCollaborativeScrewH3() {

            d0 Worker.operations._PickPlaceH3();
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._ScrewH3();
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;
        }

        VALUE doCollaborativeScrewH5() {

            d0 Worker.operations._PickPlaceH5();
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._ScrewH5();
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;
        }

        VALUE doCollaborativeScrewH8() {

            d1 Cobot.tasks._ScrewH8();
            CONTAINS [0, +INF] [0, +INF] d0;
            d0 Worker.operations._PickPlaceH8();
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;
        }

        VALUE doCollaborativeScrewH2() {

            d0 Worker.operations._PickPlaceH2();
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._ScrewH2();
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;
        }


        VALUE doCollaborativeScrewH4() {

            d0 Worker.operations._PickPlaceH4();
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._ScrewH4();
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;
        }

        VALUE doCollaborativeScrewH6() {

            d0 Worker.operations._PickPlaceH6();
            CONTAINS [0, +INF] [0, +INF] d0;
            d1 Cobot.tasks._ScrewH6();
            CONTAINS [0, +INF] [0, +INF] d1;
            d0 BEFORE [0, +INF] d1;
        }





	}

	SYNCHRONIZE Goal.goals {

		VALUE table-assembly-goal() {

			d0 ProductionL0.tasks_l0.doRotaryTable();
			CONTAINS [0, +INF] [0, +INF] d0;
		}

		VALUE screw-goal(?h) {

		    d0 ProductionL0.tasks_l0.doAutonomousScrew(?h0);

		    CONTAINS [0, +INF] [0, +INF] d0;

            ?h0 = ?h;
		}

	}


}

