DOMAIN ICAPS21_HRC_MOSAIC_R6_C4_B20W2O2  {

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

	COMP_TYPE SingletonStateVariable MosaicProcessType ( DoR1(),  DoR2(),  DoR3(),  DoR4(),  DoR5(),  DoR6(),  Idle() ) {

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

		VALUE DoR4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE Idle() [1, +INF]
		MEETS {
			 DoR1();
			 DoR2();
			 DoR3();
			 DoR4();
			 DoR5();
			 DoR6();
		}

	}

	COMP_TYPE SingletonStateVariable AssemblyProcessType ( DoR1C1(),  DoR1C2(),  DoR1C3(),  DoR1C4(),  DoR2C1(),  DoR2C2(),  DoR2C3(),  DoR2C4(),  DoR3C1(),  DoR3C2(),  DoR3C3(),  DoR3C4(),  DoR4C1(),  DoR4C2(),  DoR4C3(),  DoR4C4(),  DoR5C1(),  DoR5C2(),  DoR5C3(),  DoR5C4(),  DoR6C1(),  DoR6C2(),  DoR6C3(),  DoR6C4(),  Idle() ) {

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

		VALUE DoR4C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR4C2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR4C3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR4C4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE Idle() [1, +INF]
		MEETS {
			 DoR1C1();
			 DoR1C2();
			 DoR1C3();
			 DoR1C4();
			 DoR2C1();
			 DoR2C2();
			 DoR2C3();
			 DoR2C4();
			 DoR3C1();
			 DoR3C2();
			 DoR3C3();
			 DoR3C4();
			 DoR4C1();
			 DoR4C2();
			 DoR4C3();
			 DoR4C4();
			 DoR5C1();
			 DoR5C2();
			 DoR5C3();
			 DoR5C4();
			 DoR6C1();
			 DoR6C2();
			 DoR6C3();
			 DoR6C4();
		}

	}

	COMP_TYPE SingletonStateVariable HumanAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R3C3(),  _pickplace-R3C4(),  _pickplace-R4C1(),  _pickplace-R4C2(),  _pickplace-R4C3(),  _pickplace-R4C4(),  _pickplace-R5C1(),  _pickplace-R5C2(),  _pickplace-R5C3(),  _pickplace-R5C4(),  _pickplace-R6C1(),  _pickplace-R6C2(),  _pickplace-R6C3(),  _pickplace-R6C4(),  Idle() ) {

		VALUE _pickplace-R1C1() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C4() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [10, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C1() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [22, 32]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C3() [13, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C4() [1, 11]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C1() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C2() [27, 37]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C3() [25, 35]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C4() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C1() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C2() [19, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C3() [33, 43]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C4() [20, 30]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C1() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C2() [18, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C3() [20, 30]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C4() [35, 45]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-R1C1();
			 _pickplace-R1C2();
			 _pickplace-R1C3();
			 _pickplace-R1C4();
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R3C3();
			 _pickplace-R3C4();
			 _pickplace-R4C1();
			 _pickplace-R4C2();
			 _pickplace-R4C3();
			 _pickplace-R4C4();
			 _pickplace-R5C1();
			 _pickplace-R5C2();
			 _pickplace-R5C3();
			 _pickplace-R5C4();
			 _pickplace-R6C1();
			 _pickplace-R6C2();
			 _pickplace-R6C3();
			 _pickplace-R6C4();
		}

	}

	COMP_TYPE SingletonStateVariable RobotAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R3C3(),  _pickplace-R3C4(),  _pickplace-R4C1(),  _pickplace-R4C2(),  _pickplace-R4C3(),  _pickplace-R4C4(),  _pickplace-R5C1(),  _pickplace-R5C2(),  _pickplace-R5C3(),  _pickplace-R5C4(),  _pickplace-R6C1(),  _pickplace-R6C2(),  _pickplace-R6C3(),  _pickplace-R6C4(),  Idle() ) {

		VALUE _pickplace-R1C1() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [1, 6]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C4() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [1, 7]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [1, 7]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C1() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [10, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C3() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C4() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C1() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C2() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C3() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C4() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C1() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C2() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C3() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C4() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C1() [17, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C2() [3, 13]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C3() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C4() [1, 7]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-R1C1();
			 _pickplace-R1C2();
			 _pickplace-R1C3();
			 _pickplace-R1C4();
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R3C3();
			 _pickplace-R3C4();
			 _pickplace-R4C1();
			 _pickplace-R4C2();
			 _pickplace-R4C3();
			 _pickplace-R4C4();
			 _pickplace-R5C1();
			 _pickplace-R5C2();
			 _pickplace-R5C3();
			 _pickplace-R5C4();
			 _pickplace-R6C1();
			 _pickplace-R6C2();
			 _pickplace-R6C3();
			 _pickplace-R6C4();
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

			r3 Mosaic.process.DoR4();
			CONTAINS [0, +INF] [0, +INF] r3;

			r4 Mosaic.process.DoR5();
			CONTAINS [0, +INF] [0, +INF] r4;

			r5 Mosaic.process.DoR6();
			CONTAINS [0, +INF] [0, +INF] r5;

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

		}

		VALUE DoR4() {

			d0 Assembly.coordination.DoR4C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR4C2();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoR4C3();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoR4C4();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoR5() {

			d0 Assembly.coordination.DoR5C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR5C2();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoR5C3();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoR5C4();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoR6() {

			d0 Assembly.coordination.DoR6C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR6C2();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoR6C3();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoR6C4();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

	}

	SYNCHRONIZE Assembly.coordination {

		VALUE DoR4C3() {

			d0 Robot.task._pickplace-R4C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C3() {

			d0 Human.operation._pickplace-R4C3();
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

		VALUE DoR4C2() {

			d0 Robot.task._pickplace-R4C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C2() {

			d0 Human.operation._pickplace-R4C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C1() {

			d0 Robot.task._pickplace-R6C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C1() {

			d0 Human.operation._pickplace-R6C1();
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

		VALUE DoR1C4() {

			d0 Robot.task._pickplace-R1C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C4() {

			d0 Human.operation._pickplace-R1C4();
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

		VALUE DoR2C1() {

			d0 Robot.task._pickplace-R2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C1() {

			d0 Human.operation._pickplace-R2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C2() {

			d0 Robot.task._pickplace-R3C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C2() {

			d0 Human.operation._pickplace-R3C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C3() {

			d0 Robot.task._pickplace-R5C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C3() {

			d0 Human.operation._pickplace-R5C3();
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

		VALUE DoR4C1() {

			d0 Robot.task._pickplace-R4C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C1() {

			d0 Human.operation._pickplace-R4C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C4() {

			d0 Robot.task._pickplace-R4C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C4() {

			d0 Human.operation._pickplace-R4C4();
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

		VALUE DoR2C4() {

			d0 Robot.task._pickplace-R2C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C4() {

			d0 Human.operation._pickplace-R2C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C3() {

			d0 Robot.task._pickplace-R6C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C3() {

			d0 Human.operation._pickplace-R6C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C2() {

			d0 Robot.task._pickplace-R5C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C2() {

			d0 Human.operation._pickplace-R5C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C1() {

			d0 Robot.task._pickplace-R5C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C1() {

			d0 Human.operation._pickplace-R5C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C2() {

			d0 Robot.task._pickplace-R6C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C2() {

			d0 Human.operation._pickplace-R6C2();
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

		VALUE DoR2C3() {

			d0 Human.operation._pickplace-R2C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C4() {

			d0 Human.operation._pickplace-R5C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C4() {

			d0 Robot.task._pickplace-R6C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C3() {

			d0 Robot.task._pickplace-R1C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

	}


}

