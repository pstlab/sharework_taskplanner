DOMAIN KNOWLEDGE_PRODUCTION_AUTHORING_GEN {

	TEMPORAL_MODULE temporal_module = [0, 100], 100;

	COMP_TYPE SingletonStateVariable PositionType(Free(), Busy()) {

	    VALUE Free() [1, +INF]
	    MEETS {
	        Busy();
	    }

	    VALUE Busy() [1, +INF]
	    MEETS {
	        Free();
	    }
	}

	COMP_TYPE SingletonStateVariable GoalVariableType(DoProcess(),  Idle()) {

		VALUE Idle() [1, +INF]
		MEETS {
			DoProcess();
		}

		VALUE DoProcess() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable ProductionType(Idle(), DoDisassembly(), DoAssembly()) {

		VALUE Idle() [1, +INF]
		MEETS {
			DoDisassembly();
			DoAssembly();
		}

		VALUE DoDisassembly() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoAssembly() [1, +INF]
		MEETS {
			Idle();
		}
	}

	COMP_TYPE SingletonStateVariable ProductionDisassemblyType(Idle(), DoDisassemblyP2(), DoDisassemblyP3()) {

		VALUE Idle() [1, +INF]
		MEETS {
			DoDisassemblyP2();
			DoDisassemblyP3();
		}

		VALUE DoDisassemblyP2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoDisassemblyP3() [1, +INF]
		MEETS {
			Idle();
		}
	}


	COMP_TYPE SingletonStateVariable ProductionAssemblyType(Idle(), DoAssemblyP2(), DoAssemblyP3()) {

        VALUE Idle() [1, +INF]
        MEETS {
            DoAssemblyP2();
            DoAssemblyP3();
        }

        VALUE DoAssemblyP2() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoAssemblyP3() [1, +INF]
        MEETS {
            Idle();
        }
    }


	COMP_TYPE SingletonStateVariable ProductionDisassemblyTaskType(
	    Idle(),
	    DoPlacePieceP2(), DoPlacePieceP3(), DoPieceDisassemblyP2(),
	    DoPieceDisassemblyP3(), DoPieceReleaseP2(), DoPieceReleaseP3()) {

	    VALUE Idle() [1, +INF]
	    MEETS {
	        DoPlacePieceP2();
	        DoPlacePieceP3();
	        DoPieceDisassemblyP2();
	        DoPieceDisassemblyP3();
	        DoPieceReleaseP2();
	        DoPieceReleaseP3();
	    }

	    VALUE DoPlacePieceP2() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE DoPlacePieceP3() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceDisassemblyP2() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceDisassemblyP3() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceReleaseP2() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceReleaseP3() [1, +INF]
        MEETS {
            Idle();
        }
	}

    COMP_TYPE SingletonStateVariable ProductionAssemblyChoiceType(
        Idle(),
        DoDirectlyAssemblyP3(), DoSwapAssemblyP3()) {

        VALUE Idle() [1, +INF]
        MEETS {
            DoDirectlyAssemblyP3();
            DoSwapAssemblyP3();
        }

        VALUE DoDirectlyAssemblyP3() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoSwapAssemblyP3() [1, +INF]
        MEETS {
            Idle();
        }
    }

	COMP_TYPE SingletonStateVariable ProductionAssemblyTaskType(
        Idle(),
        DoPieceAssemblyP2(), DoPieceAssemblyP3(),
        DoPiecePickP2(), DoPiecePickP3(),
        DoPieceSwapP2P3(),
        DoPieceFinishP2(), DoPieceFinishP3()) {

        VALUE Idle() [1, +INF]
        MEETS {
            DoPieceAssemblyP2();
            DoPieceAssemblyP3();
            DoPiecePickP2();
            DoPiecePickP3();
            DoPieceSwapP2P3();
            DoPieceFinishP2();
            DoPieceFinishP3();
        }

        VALUE DoPieceAssemblyP2() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceAssemblyP3() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceSwapP2P3() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPiecePickP2() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPiecePickP3() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceFinishP2() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE DoPieceFinishP3() [1, +INF]
        MEETS {
            Idle();
        }
    }


	COMP_TYPE SingletonStateVariable WorkerType(
	    Idle(),
	    PickPlace-P1-P2(), PickPlace-P2-P3(), PickPlace-P3-P4(), PickPlace-P2-P4(),
	    PickPlace-P2-R(), PickPlace-P3-R(), PickPlace-P-P2(), PickPlace-P-P3(),
	    Assembly-P2(), Assembly-P3(), Disassembly-P2(), Disassembly-P3()) {

	    VALUE Idle() [1, +INF]
	    MEETS {
	        PickPlace-P1-P2();
	        PickPlace-P2-P3();
	        PickPlace-P3-P4();
	        PickPlace-P2-P4();
            PickPlace-P2-R();
            PickPlace-P3-R();
            PickPlace-P-P2();
            PickPlace-P-P3();
            Assembly-P2();
            Assembly-P3();
            Disassembly-P2();
            Disassembly-P3();
	    }

	    VALUE PickPlace-P1-P2() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE PickPlace-P2-P3() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE PickPlace-P3-P4() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE PickPlace-P2-P4() [1, +INF]
        MEETS {
            Idle();
        }

	    VALUE PickPlace-P2-R() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE PickPlace-P3-R() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE PickPlace-P-P2() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE PickPlace-P-P3() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE Assembly-P2() [1, +INF]
	    MEETS {
	        Idle();
	    }

	    VALUE Assembly-P3() [1, +INF]
	    MEETS {
	        Idle();
	    }

        VALUE Disassembly-P2() [1, +INF]
        MEETS {
            Idle();
        }

        VALUE Disassembly-P3() [1, +INF]
        MEETS {
            Idle();
        }
	}


	COMP_TYPE SingletonStateVariable RobotType(
    	    Idle(),
    	    PickPlace-P2-R(), PickPlace-P3-R(), PickPlace-P-P2(), PickPlace-P-P3(),
    	    Assembly-P2(), Assembly-P3(), Disassembly-P2(), Disassembly-P3()) {

    	    VALUE Idle() [1, +INF]
    	    MEETS {
                PickPlace-P2-R();
                PickPlace-P3-R();
                PickPlace-P-P2();
                PickPlace-P-P3();
                Assembly-P2();
                Assembly-P3();
                Disassembly-P2();
                Disassembly-P3();
    	    }

    	    VALUE PickPlace-P2-R() [1, +INF]
    	    MEETS {
    	        Idle();
    	    }

    	    VALUE PickPlace-P3-R() [1, +INF]
    	    MEETS {
    	        Idle();
    	    }

    	    VALUE PickPlace-P-P2() [1, +INF]
    	    MEETS {
    	        Idle();
    	    }

    	    VALUE PickPlace-P-P3() [1, +INF]
    	    MEETS {
    	        Idle();
    	    }

    	    VALUE Assembly-P2() [1, +INF]
    	    MEETS {
    	        Idle();
    	    }

    	    VALUE Assembly-P3() [1, +INF]
    	    MEETS {
    	        Idle();
    	    }

            VALUE Disassembly-P2() [1, +INF]
            MEETS {
                Idle();
            }

            VALUE Disassembly-P3() [1, +INF]
            MEETS {
                Idle();
            }
    	}


    COMPONENT Position1 {FLEXIBLE p1(primitive)} : PositionType;
    COMPONENT Position2 {FLEXIBLE p2(primitive)} : PositionType;
    COMPONENT Position3 {FLEXIBLE p3(primitive)} : PositionType;
    COMPONENT Position4 {FLEXIBLE p4(primitive)} : PositionType;

	COMPONENT Goal {FLEXIBLE goals(functional)} : GoalVariableType;
	COMPONENT Production {FLEXIBLE process(functional)} : ProductionType;

	COMPONENT Disassembly {FLEXIBLE disassembly_procedure(functional)} : ProductionDisassemblyType;
	COMPONENT DisassemblyTasks {FLEXIBLE disassembly_tasks(functional)} : ProductionDisassemblyTaskType;

	COMPONENT Assembly {FLEXIBLE assembly_procedure(functional)} : ProductionAssemblyType;
    COMPONENT AssemblyTasks {FLEXIBLE assembly_tasks(functional)} : ProductionAssemblyTaskType;
    COMPONENT AssemblyChoices {FLEXIBLE assembly_choices(functional)} : ProductionAssemblyChoiceType;


	COMPONENT Worker {FLEXIBLE operations(primitive)} :  WorkerType;
	COMPONENT Cobot {FLEXIBLE tasks(primitive)} : RobotType;


	SYNCHRONIZE Goal.goals {

	    VALUE DoProcess() {

	        cd0 Disassembly.disassembly_procedure.DoDisassemblyP2();
	        cd1 Assembly.assembly_procedure.DoAssemblyP2();

	        CONTAINS [0, +INF] [0, +INF] cd0;
	        CONTAINS [0, +INF] [0, +INF] cd1;

            cd0 BEFORE [0, +INF] cd1;
	    }

	    VALUE DoProcess() {

            cd0 Disassembly.disassembly_procedure.DoDisassemblyP3();
            cd1 Assembly.assembly_procedure.DoAssemblyP3();

            CONTAINS [0, +INF] [0, +INF] cd0;
            CONTAINS [0, +INF] [0, +INF] cd1;

            cd0 BEFORE [0, +INF] cd1;
        }

	}

	SYNCHRONIZE Production.process {

        VALUE DoDisassembly() {

            cd0 Disassembly.disassembly_procedure.DoDisassemblyP2();

            CONTAINS [0, +INF] [0, +INF] cd0;
        }

        VALUE DoDisassembly() {

            cd0 Disassembly.disassembly_procedure.DoDisassemblyP3();

            CONTAINS [0, +INF] [0, +INF] cd0;
        }

        VALUE DoAssembly() {

            cd0 Assembly.assembly_procedure.DoAssemblyP2();

            CONTAINS [0, +INF] [0, +INF] cd0;
        }

        VALUE DoAssembly() {

            cd0 Assembly.assembly_procedure.DoAssemblyP3();

            CONTAINS [0, +INF] [0, +INF] cd0;
        }
	}


    SYNCHRONIZE Assembly.assembly_procedure {

        VALUE DoAssemblyP2() {

            cd0 AssemblyTasks.disassembly_tasks.DoPiecePickP2();
            cd1 AssemblyTasks.disassembly_tasks.DoPieceAssemblyP2();
            cd2 AssemblyTasks.disassembly_tasks.DoPieceFinishP2();

            cd0 BEFORE [0, +INF] cd1;
            cd1 BEFORE [0, +INF] cd2;

            CONTAINS [0, +INF] [0, +INF] cd0;
            CONTAINS [0, +INF] [0, +INF] cd1;
            CONTAINS [0, +INF] [0, +INF] cd2;
        }

        VALUE DoAssemblyP3() {

            cd0 AssemblyTasks.assembly_tasks.DoPiecePickP3();
            cd1 AssemblyTasks.assembly_tasks.DoPieceAssemblyP3();
            cd2 AssemblyTasks.assembly_tasks.DoPieceFinishP3();

            cd0 BEFORE [0, +INF] cd1;
            cd1 BEFORE [0, +INF] cd2;

            CONTAINS [0, +INF] [0, +INF] cd0;
            CONTAINS [0, +INF] [0, +INF] cd1;
            CONTAINS [0, +INF] [0, +INF] cd2;
        }
    }



    SYNCHRONIZE Disassembly.disassembly_procedure {

        VALUE DoDisassemblyP2() {

            cd0 DisassemblyTasks.disassembly_tasks.DoPlacePieceP2();
            cd1 DisassemblyTasks.disassembly_tasks.DoPieceDisassemblyP2();
            cd2 DisassemblyTasks.disassembly_tasks.DoPieceReleaseP2();

            cd0 BEFORE [0, +INF] cd1;
            cd1 BEFORE [0, +INF] cd2;

            CONTAINS [0, +INF] [0, +INF] cd0;
            CONTAINS [0, +INF] [0, +INF] cd1;
            CONTAINS [0, +INF] [0, +INF] cd2;
        }

        VALUE DoDisassemblyP3() {

            cd0 DisassemblyTasks.disassembly_tasks.DoPlacePieceP3();
            cd1 DisassemblyTasks.disassembly_tasks.DoPieceDisassemblyP3();
            cd2 DisassemblyTasks.disassembly_tasks.DoPieceReleaseP3();

            cd0 BEFORE [0, +INF] cd1;
            cd1 BEFORE [0, +INF] cd2;

            CONTAINS [0, +INF] [0, +INF] cd0;
            CONTAINS [0, +INF] [0, +INF] cd1;
            CONTAINS [0, +INF] [0, +INF] cd2;
        }
    }

    SYNCHRONIZE DisassemblyTasks.disassembly_tasks {

        VALUE DoPlacePieceP2() {

            cd0 <?> Position1.p1.Busy();
            cd1 <?> Position2.p2.Free();

            cd3 Worker.operations.PickPlace-P1-P2();

            cd4 Position1.p1.Free();
            cd5 Position2.p2.Busy();

            STARTS-DURING [0, +INF] [0, +INF] cd0;
            STARTS-DURING [0, +INF] [0, +INF] cd1;

            CONTAINS [0, +INF] [0, +INF] cd3;

            ENDS-DURING [0, +INF] [0, +INF] cd4;
            ENDS-DURING [0, +INF] [0, +INF] cd5;
        }

        VALUE DoPlacePieceP3() {

            cd0 <?> Position1.p1.Busy();
            cd1 <?> Position2.p2.Free();
            cd2 <?> Position3.p3.Free();

            cd3 Worker.operations.PickPlace-P1-P2();

            cd4 Position1.p1.Free();
            cd5 Position2.p2.Busy();

            STARTS-DURING [0, +INF] [0, +INF] cd0;
            STARTS-DURING [0, +INF] [0, +INF] cd1;
            STARTS-DURING [0, +INF] [0, +INF] cd2;

            CONTAINS [0, +INF] [0, +INF] cd3;

            ENDS-DURING [0, +INF] [0, +INF] cd4;
            ENDS-DURING [0, +INF] [0, +INF] cd5;
        }

        VALUE DoPieceDisassemblyP2() {

            cd0 Position2.p2.Busy();

            cd1 Cobot.tasks.Disassembly-P2();

            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;
        }

        VALUE DoPieceDisassemblyP3() {

            cd0 Position3.p3.Busy();

            cd1 Cobot.tasks.Disassembly-P3();

            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;

        }


        VALUE DoPieceReleaseP2() {

            cd0 Position2.p2.Busy();

            cd1 Cobot.tasks.PickPlace-P2-R();


            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;

        }

        VALUE DoPieceReleaseP3() {

            cd0 Position3.p3.Busy();

            cd1 Cobot.tasks.PickPlace-P3-R();

            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;

        }
    }





    SYNCHRONIZE AssemblyTasks.assembly_tasks {

        VALUE DoPiecePickP2() {

            cd0 Position2.p2.Busy();

            cd1 Cobot.tasks.PickPlace-P-P2();

            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;
        }

        VALUE DoPiecePickP3() {

            cd0 Position3.p3.Busy();

            cd1 Cobot.tasks.PickPlace-P-P3();

            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;
        }

        VALUE DoPieceAssemblyP2() {

            cd0 Position2.p2.Busy();

            cd1 Cobot.tasks.Assembly-P2();

            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;
        }


        VALUE DoPieceAssemblyP3() {

            cd0 Position3.p3.Busy();

            cd1 Cobot.tasks.Assembly-P3();

            CONTAINS [0, +INF] [0, +INF] cd1;

            DURING [0, +INF] [0, +INF] cd0;
        }


        VALUE DoPieceFinishP3() {

            cd3 Worker.operations.PickPlace-P3-P4();

            cd5 Position3.p3.Free();

            CONTAINS [0, +INF] [0, +INF] cd3;

            ENDS-DURING [0, +INF] [0, +INF] cd5;
        }

        VALUE DoPieceFinishP2() {

            cd3 Worker.operations.PickPlace-P2-P4();

            cd5 Position2.p2.Free();

            CONTAINS [0, +INF] [0, +INF] cd3;

            ENDS-DURING [0, +INF] [0, +INF] cd5;
        }


    }

}

