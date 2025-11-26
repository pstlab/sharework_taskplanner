DOMAIN ICAPS21_HRC_MOSAIC_R6_C9_B44W5O5  {

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

	COMP_TYPE SingletonStateVariable AssemblyProcessType ( DoR1C1(),  DoR1C2(),  DoR1C3(),  DoR1C4(),  DoR1C5(),  DoR1C6(),  DoR1C7(),  DoR1C8(),  DoR1C9(),  DoR2C1(),  DoR2C2(),  DoR2C3(),  DoR2C4(),  DoR2C5(),  DoR2C6(),  DoR2C7(),  DoR2C8(),  DoR2C9(),  DoR3C1(),  DoR3C2(),  DoR3C3(),  DoR3C4(),  DoR3C5(),  DoR3C6(),  DoR3C7(),  DoR3C8(),  DoR3C9(),  DoR4C1(),  DoR4C2(),  DoR4C3(),  DoR4C4(),  DoR4C5(),  DoR4C6(),  DoR4C7(),  DoR4C8(),  DoR4C9(),  DoR5C1(),  DoR5C2(),  DoR5C3(),  DoR5C4(),  DoR5C5(),  DoR5C6(),  DoR5C7(),  DoR5C8(),  DoR5C9(),  DoR6C1(),  DoR6C2(),  DoR6C3(),  DoR6C4(),  DoR6C5(),  DoR6C6(),  DoR6C7(),  DoR6C8(),  DoR6C9(),  Idle() ) {

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

		VALUE DoR3C9() [1, +INF]
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

		VALUE DoR4C5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR4C6() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR4C7() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR4C8() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR4C9() [1, +INF]
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

		VALUE DoR5C5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C6() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C7() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C8() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR5C9() [1, +INF]
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

		VALUE DoR6C5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C6() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C7() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C8() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoR6C9() [1, +INF]
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
			 DoR2C1();
			 DoR2C2();
			 DoR2C3();
			 DoR2C4();
			 DoR2C5();
			 DoR2C6();
			 DoR2C7();
			 DoR2C8();
			 DoR2C9();
			 DoR3C1();
			 DoR3C2();
			 DoR3C3();
			 DoR3C4();
			 DoR3C5();
			 DoR3C6();
			 DoR3C7();
			 DoR3C8();
			 DoR3C9();
			 DoR4C1();
			 DoR4C2();
			 DoR4C3();
			 DoR4C4();
			 DoR4C5();
			 DoR4C6();
			 DoR4C7();
			 DoR4C8();
			 DoR4C9();
			 DoR5C1();
			 DoR5C2();
			 DoR5C3();
			 DoR5C4();
			 DoR5C5();
			 DoR5C6();
			 DoR5C7();
			 DoR5C8();
			 DoR5C9();
			 DoR6C1();
			 DoR6C2();
			 DoR6C3();
			 DoR6C4();
			 DoR6C5();
			 DoR6C6();
			 DoR6C7();
			 DoR6C8();
			 DoR6C9();
		}

	}

	COMP_TYPE SingletonStateVariable HumanAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R1C5(),  _pickplace-R1C6(),  _pickplace-R1C7(),  _pickplace-R1C8(),  _pickplace-R1C9(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R2C5(),  _pickplace-R2C6(),  _pickplace-R2C7(),  _pickplace-R2C8(),  _pickplace-R2C9(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R3C3(),  _pickplace-R3C4(),  _pickplace-R3C5(),  _pickplace-R3C6(),  _pickplace-R3C7(),  _pickplace-R3C8(),  _pickplace-R3C9(),  _pickplace-R4C1(),  _pickplace-R4C2(),  _pickplace-R4C3(),  _pickplace-R4C4(),  _pickplace-R4C5(),  _pickplace-R4C6(),  _pickplace-R4C7(),  _pickplace-R4C8(),  _pickplace-R4C9(),  _pickplace-R5C1(),  _pickplace-R5C2(),  _pickplace-R5C3(),  _pickplace-R5C4(),  _pickplace-R5C5(),  _pickplace-R5C6(),  _pickplace-R5C7(),  _pickplace-R5C8(),  _pickplace-R5C9(),  _pickplace-R6C1(),  _pickplace-R6C2(),  _pickplace-R6C3(),  _pickplace-R6C4(),  _pickplace-R6C5(),  _pickplace-R6C6(),  _pickplace-R6C7(),  _pickplace-R6C8(),  _pickplace-R6C9(),  Idle() ) {

		VALUE _pickplace-R1C1() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [1, 7]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C4() [25, 35]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C5() [36, 46]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C6() [34, 44]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C7() [26, 36]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C8() [21, 31]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C9() [35, 45]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [35, 45]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [36, 46]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C5() [23, 33]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C6() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C7() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C8() [1, 6]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C9() [29, 39]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C1() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [32, 42]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C3() [24, 34]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C4() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C5() [1, 11]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C6() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C7() [25, 35]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C8() [21, 31]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C9() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C1() [1, 11]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C2() [22, 32]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C3() [26, 36]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C4() [1, 7]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C5() [19, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C6() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C7() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C8() [25, 35]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C9() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C1() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C2() [7, 17]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C3() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C4() [25, 35]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C5() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C6() [13, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C7() [30, 40]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C8() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C9() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C1() [19, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C2() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C3() [9, 19]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C4() [10, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C5() [7, 17]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C6() [31, 41]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C7() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C8() [18, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C9() [3, 13]
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
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R2C5();
			 _pickplace-R2C6();
			 _pickplace-R2C7();
			 _pickplace-R2C8();
			 _pickplace-R2C9();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R3C3();
			 _pickplace-R3C4();
			 _pickplace-R3C5();
			 _pickplace-R3C6();
			 _pickplace-R3C7();
			 _pickplace-R3C8();
			 _pickplace-R3C9();
			 _pickplace-R4C1();
			 _pickplace-R4C2();
			 _pickplace-R4C3();
			 _pickplace-R4C4();
			 _pickplace-R4C5();
			 _pickplace-R4C6();
			 _pickplace-R4C7();
			 _pickplace-R4C8();
			 _pickplace-R4C9();
			 _pickplace-R5C1();
			 _pickplace-R5C2();
			 _pickplace-R5C3();
			 _pickplace-R5C4();
			 _pickplace-R5C5();
			 _pickplace-R5C6();
			 _pickplace-R5C7();
			 _pickplace-R5C8();
			 _pickplace-R5C9();
			 _pickplace-R6C1();
			 _pickplace-R6C2();
			 _pickplace-R6C3();
			 _pickplace-R6C4();
			 _pickplace-R6C5();
			 _pickplace-R6C6();
			 _pickplace-R6C7();
			 _pickplace-R6C8();
			 _pickplace-R6C9();
		}

	}

	COMP_TYPE SingletonStateVariable RobotAgentType ( _pickplace-R1C1(),  _pickplace-R1C2(),  _pickplace-R1C3(),  _pickplace-R1C4(),  _pickplace-R1C5(),  _pickplace-R1C6(),  _pickplace-R1C7(),  _pickplace-R1C8(),  _pickplace-R1C9(),  _pickplace-R2C1(),  _pickplace-R2C2(),  _pickplace-R2C3(),  _pickplace-R2C4(),  _pickplace-R2C5(),  _pickplace-R2C6(),  _pickplace-R2C7(),  _pickplace-R2C8(),  _pickplace-R2C9(),  _pickplace-R3C1(),  _pickplace-R3C2(),  _pickplace-R3C3(),  _pickplace-R3C4(),  _pickplace-R3C5(),  _pickplace-R3C6(),  _pickplace-R3C7(),  _pickplace-R3C8(),  _pickplace-R3C9(),  _pickplace-R4C1(),  _pickplace-R4C2(),  _pickplace-R4C3(),  _pickplace-R4C4(),  _pickplace-R4C5(),  _pickplace-R4C6(),  _pickplace-R4C7(),  _pickplace-R4C8(),  _pickplace-R4C9(),  _pickplace-R5C1(),  _pickplace-R5C2(),  _pickplace-R5C3(),  _pickplace-R5C4(),  _pickplace-R5C5(),  _pickplace-R5C6(),  _pickplace-R5C7(),  _pickplace-R5C8(),  _pickplace-R5C9(),  _pickplace-R6C1(),  _pickplace-R6C2(),  _pickplace-R6C3(),  _pickplace-R6C4(),  _pickplace-R6C5(),  _pickplace-R6C6(),  _pickplace-R6C7(),  _pickplace-R6C8(),  _pickplace-R6C9(),  Idle() ) {

		VALUE _pickplace-R1C1() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C2() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C3() [1, 11]
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

		VALUE _pickplace-R1C6() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C7() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C8() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R1C9() [8, 18]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C1() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C2() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C3() [17, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C4() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C5() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C6() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C7() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C8() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R2C9() [1, 11]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C1() [1, 6]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C2() [16, 26]
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

		VALUE _pickplace-R3C5() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C6() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C7() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C8() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R3C9() [7, 17]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C1() [1, 7]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C2() [7, 17]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C3() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C4() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C5() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C6() [13, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C7() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C8() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R4C9() [6, 16]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C1() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C2() [10, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C3() [12, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C4() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C5() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C6() [10, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C7() [1, 5]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C8() [4, 14]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R5C9() [11, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C1() [1, 10]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C2() [16, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C3() [5, 15]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C4() [1, 9]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C5() [1, 8]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C6() [2, 12]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C7() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C8() [1, 6]
		MEETS {
			Idle();

		}

		VALUE _pickplace-R6C9() [1, 11]
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
			 _pickplace-R2C1();
			 _pickplace-R2C2();
			 _pickplace-R2C3();
			 _pickplace-R2C4();
			 _pickplace-R2C5();
			 _pickplace-R2C6();
			 _pickplace-R2C7();
			 _pickplace-R2C8();
			 _pickplace-R2C9();
			 _pickplace-R3C1();
			 _pickplace-R3C2();
			 _pickplace-R3C3();
			 _pickplace-R3C4();
			 _pickplace-R3C5();
			 _pickplace-R3C6();
			 _pickplace-R3C7();
			 _pickplace-R3C8();
			 _pickplace-R3C9();
			 _pickplace-R4C1();
			 _pickplace-R4C2();
			 _pickplace-R4C3();
			 _pickplace-R4C4();
			 _pickplace-R4C5();
			 _pickplace-R4C6();
			 _pickplace-R4C7();
			 _pickplace-R4C8();
			 _pickplace-R4C9();
			 _pickplace-R5C1();
			 _pickplace-R5C2();
			 _pickplace-R5C3();
			 _pickplace-R5C4();
			 _pickplace-R5C5();
			 _pickplace-R5C6();
			 _pickplace-R5C7();
			 _pickplace-R5C8();
			 _pickplace-R5C9();
			 _pickplace-R6C1();
			 _pickplace-R6C2();
			 _pickplace-R6C3();
			 _pickplace-R6C4();
			 _pickplace-R6C5();
			 _pickplace-R6C6();
			 _pickplace-R6C7();
			 _pickplace-R6C8();
			 _pickplace-R6C9();
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

			d8 Assembly.coordination.DoR3C9();
			CONTAINS [0, +INF] [0, +INF] d8;

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

			d4 Assembly.coordination.DoR4C5();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoR4C6();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoR4C7();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoR4C8();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoR4C9();
			CONTAINS [0, +INF] [0, +INF] d8;

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

			d4 Assembly.coordination.DoR5C5();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoR5C6();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoR5C7();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoR5C8();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoR5C9();
			CONTAINS [0, +INF] [0, +INF] d8;

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

			d4 Assembly.coordination.DoR6C5();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoR6C6();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoR6C7();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoR6C8();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoR6C9();
			CONTAINS [0, +INF] [0, +INF] d8;

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

		VALUE DoR1C7() {

			d0 Robot.task._pickplace-R1C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C7() {

			d0 Human.operation._pickplace-R1C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C5() {

			d0 Robot.task._pickplace-R4C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C5() {

			d0 Human.operation._pickplace-R4C5();
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

		VALUE DoR3C9() {

			d0 Robot.task._pickplace-R3C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C9() {

			d0 Human.operation._pickplace-R3C9();
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

		VALUE DoR5C3() {

			d0 Robot.task._pickplace-R5C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C3() {

			d0 Human.operation._pickplace-R5C3();
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

		VALUE DoR6C1() {

			d0 Robot.task._pickplace-R6C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C1() {

			d0 Human.operation._pickplace-R6C1();
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

		VALUE DoR2C9() {

			d0 Robot.task._pickplace-R2C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C9() {

			d0 Human.operation._pickplace-R2C9();
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

		VALUE DoR1C6() {

			d0 Robot.task._pickplace-R1C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C6() {

			d0 Human.operation._pickplace-R1C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C6() {

			d0 Robot.task._pickplace-R6C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C6() {

			d0 Human.operation._pickplace-R6C6();
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

		VALUE DoR6C4() {

			d0 Robot.task._pickplace-R6C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C4() {

			d0 Human.operation._pickplace-R6C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C7() {

			d0 Robot.task._pickplace-R5C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C7() {

			d0 Human.operation._pickplace-R5C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C6() {

			d0 Robot.task._pickplace-R4C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C6() {

			d0 Human.operation._pickplace-R4C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C4() {

			d0 Robot.task._pickplace-R5C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C4() {

			d0 Human.operation._pickplace-R5C4();
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

		VALUE DoR1C3() {

			d0 Robot.task._pickplace-R1C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C3() {

			d0 Human.operation._pickplace-R1C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C6() {

			d0 Robot.task._pickplace-R5C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C6() {

			d0 Human.operation._pickplace-R5C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C9() {

			d0 Robot.task._pickplace-R6C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C9() {

			d0 Human.operation._pickplace-R6C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C7() {

			d0 Robot.task._pickplace-R3C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C7() {

			d0 Human.operation._pickplace-R3C7();
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

		VALUE DoR4C8() {

			d0 Robot.task._pickplace-R4C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C8() {

			d0 Human.operation._pickplace-R4C8();
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

		VALUE DoR6C8() {

			d0 Robot.task._pickplace-R6C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C8() {

			d0 Human.operation._pickplace-R6C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C7() {

			d0 Robot.task._pickplace-R6C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C7() {

			d0 Human.operation._pickplace-R6C7();
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

		VALUE DoR2C1() {

			d0 Robot.task._pickplace-R2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C1() {

			d0 Human.operation._pickplace-R2C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C9() {

			d0 Robot.task._pickplace-R5C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C9() {

			d0 Human.operation._pickplace-R5C9();
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

		VALUE DoR3C5() {

			d0 Robot.task._pickplace-R3C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR3C5() {

			d0 Human.operation._pickplace-R3C5();
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

		VALUE DoR2C3() {

			d0 Robot.task._pickplace-R2C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C3() {

			d0 Human.operation._pickplace-R2C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C7() {

			d0 Robot.task._pickplace-R4C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C7() {

			d0 Human.operation._pickplace-R4C7();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C5() {

			d0 Robot.task._pickplace-R5C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C5() {

			d0 Human.operation._pickplace-R5C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C9() {

			d0 Robot.task._pickplace-R4C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C9() {

			d0 Human.operation._pickplace-R4C9();
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

		VALUE DoR6C5() {

			d0 Robot.task._pickplace-R6C5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C5() {

			d0 Human.operation._pickplace-R6C5();
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

		VALUE DoR6C2() {

			d0 Robot.task._pickplace-R6C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C2() {

			d0 Human.operation._pickplace-R6C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C2() {

			d0 Human.operation._pickplace-R5C2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C9() {

			d0 Human.operation._pickplace-R1C9();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C3() {

			d0 Human.operation._pickplace-R4C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C8() {

			d0 Human.operation._pickplace-R5C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR5C1() {

			d0 Human.operation._pickplace-R5C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR4C1() {

			d0 Robot.task._pickplace-R4C1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C8() {

			d0 Robot.task._pickplace-R1C8();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR2C6() {

			d0 Robot.task._pickplace-R2C6();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR6C3() {

			d0 Robot.task._pickplace-R6C3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoR1C4() {

			d0 Robot.task._pickplace-R1C4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

	}


}

