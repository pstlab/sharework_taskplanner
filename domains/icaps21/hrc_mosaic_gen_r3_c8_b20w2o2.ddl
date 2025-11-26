DOMAIN ICAPS21_HRC_MOSAIC_R3_C8_B20W2O2  {

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

	COMP_TYPE SingletonStateVariable MosaicProcessType ( DoR1(),  DoR2(),  DoR3(),  Idle() ) {

		VALUE DoR1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE Idle() [1, +INF]
		MEETS {
			 DoR1();
			 DoR2();
			 DoR3();
		}

	}

	COMP_TYPE SingletonStateVariable AssemblyProcessType ( DoR1C1(),  DoR1C2(),  DoR1C3(),  DoR1C4(),  DoR1C5(),  DoR1C6(),  DoR1C7(),  DoR1C8(),  DoR2C1(),  DoR2C2(),  DoR2C3(),  DoR2C4(),  DoR2C5(),  DoR2C6(),  DoR2C7(),  DoR2C8(),  DoR3C1(),  DoR3C2(),  DoR3C3(),  DoR3C4(),  DoR3C5(),  DoR3C6(),  DoR3C7(),  DoR3C8(),  Idle() ) {

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

		VALUE DoR3C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C6() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C7() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C8() [1, +INF]
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
			 DoR2C1();
			 DoR2C2();
			 DoR2C3();
			 DoR2C4();
			 DoR2C5();
			 DoR2C6();
			 DoR2C7();
			 DoR2C8();
			 DoR3C1();
			 DoR3C2();
			 DoR3C3();
			 DoR3C4();
			 DoR3C5();
			 DoR3C6();
			 DoR3C7();
			 DoR3C8();
		}

	}

	COMP_TYPE SingletonStateVariable HumanAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R1C5(),  _pickplace-R1C6(),  _pickplace-R1C7(),  _pickplace-R1C8(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R2C5(),  _pickplace-R2C6(),  _pickplace-R2C7(),  _pickplace-R2C8(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R3C3(),  _pickplace-R3C4(),  _pickplace-R3C5(),  _pickplace-R3C6(),  _pickplace-R3C7(),  _pickplace-R3C8(),  Idle() ) {

		VALUE _pickplace-R1C1() [27, 37]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C4() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C5() [31, 41]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C6() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C7() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C8() [33, 43]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [18, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [31, 41]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [21, 31]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C5() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C6() [22, 32]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C7() [35, 45]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C8() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C1() [34, 44]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C3() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C4() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C5() [34, 44]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C6() [20, 30]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C7() [18, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C8() [3, 13]
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
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R2C5();
			 _pickplace-R2C6();
			 _pickplace-R2C7();
			 _pickplace-R2C8();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R3C3();
			 _pickplace-R3C4();
			 _pickplace-R3C5();
			 _pickplace-R3C6();
			 _pickplace-R3C7();
			 _pickplace-R3C8();
		}

	}

	COMP_TYPE SingletonStateVariable RobotAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R1C5(),  _pickplace-R1C6(),  _pickplace-R1C7(),  _pickplace-R1C8(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R2C5(),  _pickplace-R2C6(),  _pickplace-R2C7(),  _pickplace-R2C8(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R3C3(),  _pickplace-R3C4(),  _pickplace-R3C5(),  _pickplace-R3C6(),  _pickplace-R3C7(),  _pickplace-R3C8(),  Idle() ) {

		VALUE _pickplace-R1C1() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C4() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C5() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C6() [7, 17]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C7() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C8() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [3, 13]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C5() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C6() [16, 26]
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

		VALUE _pickplace-R3C1() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C3() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C4() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C5() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C6() [13, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C7() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C8() [9, 19]
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
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R2C5();
			 _pickplace-R2C6();
			 _pickplace-R2C7();
			 _pickplace-R2C8();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R3C3();
			 _pickplace-R3C4();
			 _pickplace-R3C5();
			 _pickplace-R3C6();
			 _pickplace-R3C7();
			 _pickplace-R3C8();
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

			r2 Mosaic.process.DoR3();
			CONTAINS [0, +INF] [0, +INF] r2;

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

		}

		VALUE DoR3() {

			d0 Assembly.coordination.DoR3C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR3C2();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoR3C3();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoR3C4();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoR3C5();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoR3C6();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoR3C7();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoR3C8();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

	}

	SYNCHRONIZE Assembly.coordination {

		VALUE DoR3C2() {

			d0 Robot.task._pickplace-R3C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C2() {

			d0 Human.operation._pickplace-R3C2();
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

		VALUE DoR3C3() {

			d0 Robot.task._pickplace-R3C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C3() {

			d0 Human.operation._pickplace-R3C3();
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

		VALUE DoR2C5() {

			d0 Robot.task._pickplace-R2C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C5() {

			d0 Human.operation._pickplace-R2C5();
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

		VALUE DoR1C2() {

			d0 Robot.task._pickplace-R1C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C2() {

			d0 Human.operation._pickplace-R1C2();
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

		VALUE DoR3C1() {

			d0 Robot.task._pickplace-R3C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C1() {

			d0 Human.operation._pickplace-R3C1();
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

		VALUE DoR3C5() {

			d0 Robot.task._pickplace-R3C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C5() {

			d0 Human.operation._pickplace-R3C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C1() {

			d0 Robot.task._pickplace-R2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C1() {

			d0 Human.operation._pickplace-R2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C6() {

			d0 Robot.task._pickplace-R3C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C6() {

			d0 Human.operation._pickplace-R3C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C8() {

			d0 Robot.task._pickplace-R3C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C8() {

			d0 Human.operation._pickplace-R3C8();
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

		VALUE DoR3C4() {

			d0 Robot.task._pickplace-R3C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C4() {

			d0 Human.operation._pickplace-R3C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C3() {

			d0 Robot.task._pickplace-R1C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C3() {

			d0 Human.operation._pickplace-R1C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C6() {

			d0 Robot.task._pickplace-R2C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C6() {

			d0 Human.operation._pickplace-R2C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C1() {

			d0 Human.operation._pickplace-R1C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C4() {

			d0 Human.operation._pickplace-R2C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C3() {

			d0 Robot.task._pickplace-R2C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C7() {

			d0 Robot.task._pickplace-R3C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

	}


}

