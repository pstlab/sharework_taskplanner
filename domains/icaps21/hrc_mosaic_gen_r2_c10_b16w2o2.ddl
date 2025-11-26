DOMAIN ICAPS21_HRC_MOSAIC_R2_C10_B16W2O2  {

	TEMPORAL_MODULE temporal_module = [0, 100000], 100;

	COMP_TYPE SingletonStateVariable GoalType ( DoMosaic(), Idle() ) { 

		VALUE Idle() [1, +INF]
		MEETS {
			DoMosaic();
		}

		VALUE DoMosaic() [1, +INF]
		MEETS {
			Idle();
		}

	}

	COMP_TYPE SingletonStateVariable MosaicProcessType ( DoR1(),  DoR2(),  Idle() ) {

		VALUE DoR1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE Idle() [1, +INF]
		MEETS {
			 DoR1();
			 DoR2();
		}

	}

	COMP_TYPE SingletonStateVariable AssemblyProcessType ( DoR1C1(),  DoR1C2(),  DoR1C3(),  DoR1C4(),  DoR1C5(),  DoR1C6(),  DoR1C7(),  DoR1C8(),  DoR1C9(),  DoR1C10(),  DoR2C1(),  DoR2C2(),  DoR2C3(),  DoR2C4(),  DoR2C5(),  DoR2C6(),  DoR2C7(),  DoR2C8(),  DoR2C9(),  DoR2C10(),  Idle() ) {

		VALUE DoR1C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C6() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C7() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C8() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C9() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C10() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C6() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C7() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C8() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C9() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2C10() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE Idle() [1, +INF]
		MEETS {
			 DoR1C1();
			 DoR1C2();
			 DoR1C3();
			 DoR1C4();
			 DoR1C5();
			 DoR1C6();
			 DoR1C7();
			 DoR1C8();
			 DoR1C9();
			 DoR1C10();
			 DoR2C1();
			 DoR2C2();
			 DoR2C3();
			 DoR2C4();
			 DoR2C5();
			 DoR2C6();
			 DoR2C7();
			 DoR2C8();
			 DoR2C9();
			 DoR2C10();
		}

	}

	COMP_TYPE SingletonStateVariable HumanAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R1C5(),  _pickplace-R1C6(),  _pickplace-R1C7(),  _pickplace-R1C8(),  _pickplace-R1C9(),  _pickplace-R1C10(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R2C5(),  _pickplace-R2C6(),  _pickplace-R2C7(),  _pickplace-R2C8(),  _pickplace-R2C9(),  _pickplace-R2C10(),  Idle() ) {

		VALUE _pickplace-R1C1() [36, 46]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [13, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C4() [17, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C5() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C6() [25, 35]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C7() [17, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C8() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C9() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C10() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [20, 30]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C5() [36, 46]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C6() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C7() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C8() [3, 13]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C9() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C10() [1, 11]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-R1C1();
			 _pickplace-R1C2();
			 _pickplace-R1C3();
			 _pickplace-R1C4();
			 _pickplace-R1C5();
			 _pickplace-R1C6();
			 _pickplace-R1C7();
			 _pickplace-R1C8();
			 _pickplace-R1C9();
			 _pickplace-R1C10();
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R2C5();
			 _pickplace-R2C6();
			 _pickplace-R2C7();
			 _pickplace-R2C8();
			 _pickplace-R2C9();
			 _pickplace-R2C10();
		}

	}

	COMP_TYPE SingletonStateVariable RobotAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R1C5(),  _pickplace-R1C6(),  _pickplace-R1C7(),  _pickplace-R1C8(),  _pickplace-R1C9(),  _pickplace-R1C10(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R2C5(),  _pickplace-R2C6(),  _pickplace-R2C7(),  _pickplace-R2C8(),  _pickplace-R2C9(),  _pickplace-R2C10(),  Idle() ) {

		VALUE _pickplace-R1C1() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C4() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C5() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C6() [17, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C7() [3, 13]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C8() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C9() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C10() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C5() [7, 17]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C6() [1, 7]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C7() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C8() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C9() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C10() [10, 20]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-R1C1();
			 _pickplace-R1C2();
			 _pickplace-R1C3();
			 _pickplace-R1C4();
			 _pickplace-R1C5();
			 _pickplace-R1C6();
			 _pickplace-R1C7();
			 _pickplace-R1C8();
			 _pickplace-R1C9();
			 _pickplace-R1C10();
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R2C5();
			 _pickplace-R2C6();
			 _pickplace-R2C7();
			 _pickplace-R2C8();
			 _pickplace-R2C9();
			 _pickplace-R2C10();
		}

	}

	COMPONENT Goal { FLEXIBLE hrc(functional) } : GoalType;
	COMPONENT Mosaic { FLEXIBLE process(functional) } : MosaicProcessType;
	COMPONENT Assembly { FLEXIBLE coordination(functional) } : AssemblyProcessType;
	COMPONENT Robot { FLEXIBLE task(primitive) } : RobotAgentType;
	COMPONENT Human { FLEXIBLE operation(primitive) } : HumanAgentType;


	SYNCHRONIZE Goal.hrc {

		VALUE DoMosaic() {

			r0 Mosaic.process.DoR1();
			CONTAINS [0, +INF] [0, +INF] r0;

			r1 Mosaic.process.DoR2();
			CONTAINS [0, +INF] [0, +INF] r1;

		}
	}

	SYNCHRONIZE Mosaic.process {

		VALUE DoR1() {

			d0 Assembly.coordination.DoR1C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR1C2();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoR1C3();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoR1C4();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoR1C5();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoR1C6();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoR1C7();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoR1C8();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoR1C9();
			CONTAINS [0, +INF] [0, +INF] d8;

			d9 Assembly.coordination.DoR1C10();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoR2() {

			d0 Assembly.coordination.DoR2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR2C2();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoR2C3();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoR2C4();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoR2C5();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoR2C6();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoR2C7();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoR2C8();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoR2C9();
			CONTAINS [0, +INF] [0, +INF] d8;

			d9 Assembly.coordination.DoR2C10();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

	}

	SYNCHRONIZE Assembly.coordination {

		VALUE DoR1C3() {

			d0 Robot.task._pickplace-R1C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C3() {

			d0 Human.operation._pickplace-R1C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C4() {

			d0 Robot.task._pickplace-R1C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C4() {

			d0 Human.operation._pickplace-R1C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C5() {

			d0 Robot.task._pickplace-R2C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C5() {

			d0 Human.operation._pickplace-R2C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C9() {

			d0 Robot.task._pickplace-R1C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C9() {

			d0 Human.operation._pickplace-R1C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C8() {

			d0 Robot.task._pickplace-R1C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C8() {

			d0 Human.operation._pickplace-R1C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C7() {

			d0 Robot.task._pickplace-R2C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C7() {

			d0 Human.operation._pickplace-R2C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C4() {

			d0 Robot.task._pickplace-R2C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C4() {

			d0 Human.operation._pickplace-R2C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C7() {

			d0 Robot.task._pickplace-R1C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C7() {

			d0 Human.operation._pickplace-R1C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C5() {

			d0 Robot.task._pickplace-R1C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C5() {

			d0 Human.operation._pickplace-R1C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C1() {

			d0 Robot.task._pickplace-R1C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C1() {

			d0 Human.operation._pickplace-R1C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C10() {

			d0 Robot.task._pickplace-R2C10();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C10() {

			d0 Human.operation._pickplace-R2C10();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C8() {

			d0 Robot.task._pickplace-R2C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C8() {

			d0 Human.operation._pickplace-R2C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C9() {

			d0 Robot.task._pickplace-R2C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C9() {

			d0 Human.operation._pickplace-R2C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C2() {

			d0 Robot.task._pickplace-R2C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C2() {

			d0 Human.operation._pickplace-R2C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C6() {

			d0 Robot.task._pickplace-R1C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C6() {

			d0 Human.operation._pickplace-R1C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C3() {

			d0 Robot.task._pickplace-R2C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C3() {

			d0 Human.operation._pickplace-R2C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C6() {

			d0 Human.operation._pickplace-R2C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C1() {

			d0 Human.operation._pickplace-R2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C2() {

			d0 Robot.task._pickplace-R1C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C10() {

			d0 Robot.task._pickplace-R1C10();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

	}


}

