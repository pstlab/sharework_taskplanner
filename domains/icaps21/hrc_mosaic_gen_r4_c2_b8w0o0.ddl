DOMAIN ICAPS21_HRC_MOSAIC_R4_C2_B8W0O0  {

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

	COMP_TYPE SingletonStateVariable MosaicProcessType ( DoR1(),  DoR2(),  DoR3(),  DoR4(),  Idle() ) {

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

		VALUE Idle() [1, +INF]
		MEETS {
			 DoR1();
			 DoR2();
			 DoR3();
			 DoR4();
		}

	}

	COMP_TYPE SingletonStateVariable AssemblyProcessType ( DoR1C1(),  DoR1C2(),  DoR2C1(),  DoR2C2(),  DoR3C1(),  DoR3C2(),  DoR4C1(),  DoR4C2(),  Idle() ) {

		VALUE DoR1C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR1C2() [1, +INF]
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

		VALUE DoR3C1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR3C2() [1, +INF]
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

		VALUE Idle() [1, +INF]
		MEETS {
			 DoR1C1();
			 DoR1C2();
			 DoR2C1();
			 DoR2C2();
			 DoR3C1();
			 DoR3C2();
			 DoR4C1();
			 DoR4C2();
		}

	}

	COMP_TYPE SingletonStateVariable HumanAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R4C1(),  _pickplace-R4C2(),  Idle() ) {

		VALUE _pickplace-R1C1() [21, 31]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [10, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [1, 7]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C1() [31, 41]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [3, 13]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C1() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C2() [8, 18]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-R1C1();
			 _pickplace-R1C2();
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R4C1();
			 _pickplace-R4C2();
		}

	}

	COMP_TYPE SingletonStateVariable RobotAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R4C1(),  _pickplace-R4C2(),  Idle() ) {

		VALUE _pickplace-R1C1() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [1, 11]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [7, 17]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C1() [13, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C1() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C2() [15, 25]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-R1C1();
			 _pickplace-R1C2();
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R4C1();
			 _pickplace-R4C2();
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

		}
	}

	SYNCHRONIZE Mosaic.process {

		VALUE DoR1() {

			d0 Assembly.coordination.DoR1C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR1C2();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoR2() {

			d0 Assembly.coordination.DoR2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR2C2();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoR3() {

			d0 Assembly.coordination.DoR3C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR3C2();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoR4() {

			d0 Assembly.coordination.DoR4C1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoR4C2();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

	}

	SYNCHRONIZE Assembly.coordination {

		VALUE DoR4C2() {

			d0 Robot.task._pickplace-R4C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C2() {

			d0 Human.operation._pickplace-R4C2();
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

		VALUE DoR2C2() {

			d0 Robot.task._pickplace-R2C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C2() {

			d0 Human.operation._pickplace-R2C2();
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

		VALUE DoR1C1() {

			d0 Robot.task._pickplace-R1C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C1() {

			d0 Human.operation._pickplace-R1C1();
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

		VALUE DoR1C2() {

			d0 Robot.task._pickplace-R1C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C2() {

			d0 Human.operation._pickplace-R1C2();
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

	}


}

