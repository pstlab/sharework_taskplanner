DOMAIN SHAREWORK_HRC_MOSAIC_GEN {

	TEMPORAL_MODULE temporal_module = [0, 7000], 100;

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

	COMP_TYPE SingletonStateVariable MosaicProcessType ( DoRow1(),  DoRow2(),  DoRow3(),  DoRow4(),  DoRow5(),  Idle() ) {

		VALUE DoRow1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoRow2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoRow3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoRow4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoRow5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE Idle() [1, +INF]
		MEETS {
			DoRow1();
			DoRow2();
			DoRow3();
			DoRow4();
			DoRow5();
		}

	}

	COMP_TYPE SingletonStateVariable AssemblyProcessType ( DoCellA1(),  DoCellB1(),  DoCellC1(),  DoCellD1(),  DoCellE1(),  DoCellF1(),  DoCellG1(),  DoCellH1(),  DoCellI1(),  DoCellJ1(),  DoCellA2(),  DoCellB2(),  DoCellC2(),  DoCellD2(),  DoCellE2(),  DoCellF2(),  DoCellG2(),  DoCellH2(),  DoCellI2(),  DoCellJ2(),  DoCellA3(),  DoCellB3(),  DoCellC3(),  DoCellD3(),  DoCellE3(),  DoCellF3(),  DoCellG3(),  DoCellH3(),  DoCellI3(),  DoCellJ3(),  DoCellA4(),  DoCellB4(),  DoCellC4(),  DoCellD4(),  DoCellE4(),  DoCellF4(),  DoCellG4(),  DoCellH4(),  DoCellI4(),  DoCellJ4(),  DoCellA5(),  DoCellB5(),  DoCellC5(),  DoCellD5(),  DoCellE5(),  DoCellF5(),  DoCellG5(),  DoCellH5(),  DoCellI5(),  DoCellJ5(),  Idle() ) {

		VALUE DoCellA1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellB1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellC1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellD1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellE1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellF1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellG1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellH1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellI1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellJ1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellA2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellB2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellC2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellD2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellE2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellF2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellG2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellH2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellI2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellJ2() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellA3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellB3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellC3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellD3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellE3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellF3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellG3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellH3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellI3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellJ3() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellA4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellB4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellC4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellD4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellE4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellF4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellG4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellH4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellI4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellJ4() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellA5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellB5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellC5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellD5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellE5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellF5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellG5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellH5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellI5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellJ5() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE Idle() [1, +INF]
		MEETS {
			DoCellA1();
			DoCellB1();
			DoCellC1();
			DoCellD1();
			DoCellE1();
			DoCellF1();
			DoCellG1();
			DoCellH1();
			DoCellI1();
			DoCellJ1();
			DoCellA2();
			DoCellB2();
			DoCellC2();
			DoCellD2();
			DoCellE2();
			DoCellF2();
			DoCellG2();
			DoCellH2();
			DoCellI2();
			DoCellJ2();
			DoCellA3();
			DoCellB3();
			DoCellC3();
			DoCellD3();
			DoCellE3();
			DoCellF3();
			DoCellG3();
			DoCellH3();
			DoCellI3();
			DoCellJ3();
			DoCellA4();
			DoCellB4();
			DoCellC4();
			DoCellD4();
			DoCellE4();
			DoCellF4();
			DoCellG4();
			DoCellH4();
			DoCellI4();
			DoCellJ4();
			DoCellA5();
			DoCellB5();
			DoCellC5();
			DoCellD5();
			DoCellE5();
			DoCellF5();
			DoCellG5();
			DoCellH5();
			DoCellI5();
			DoCellJ5();
		}

	}

	COMP_TYPE SingletonStateVariable HumanAgentType (_pickplace-F2(), _pickplace-H4(), _pickplace-F1(), _pickplace-H3(), _pickplace-J5(), _pickplace-H2(), _pickplace-J4(), _pickplace-H1(), _pickplace-J3(), _pickplace-B2(), _pickplace-D4(), _pickplace-D3(), _pickplace-F5(), _pickplace-D2(), _pickplace-F4(), _pickplace-D1(), _pickplace-F3(), _pickplace-H5(), _pickplace-B4(), _pickplace-D5(), _pickplace-J2(), _pickplace-J1(), _pickplace-I5(), _pickplace-E1(), _pickplace-G3(), _pickplace-I4(), _pickplace-G2(), _pickplace-G1(), _pickplace-I3(), _pickplace-I2(), _pickplace-E5(), _pickplace-C2(), _pickplace-E4(), _pickplace-G5(), _pickplace-E3(), _pickplace-G4(), _pickplace-E2(), _pickplace-A4(), _pickplace-I1(),  Idle() ) {

		VALUE _pickplace-F2() [7, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H4() [7, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-F1() [5, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H3() [8, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J5() [6, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H2() [5, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J4() [5, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H1() [7, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J3() [7, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-B2() [7, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D4() [7, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D3() [8, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-F5() [9, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D2() [8, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-F4() [9, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D1() [8, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-F3() [6, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H5() [8, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-B4() [7, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D5() [7, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J2() [5, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J1() [7, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-I5() [8, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-E1() [8, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G3() [9, 22]
		MEETS {
			Idle();

		}

		VALUE _pickplace-I4() [7, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G2() [10, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G1() [7, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-I3() [7, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-I2() [7, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-E5() [7, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-C2() [8, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-E4() [7, 21]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G5() [8, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-E3() [8, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G4() [6, 23]
		MEETS {
			Idle();

		}

		VALUE _pickplace-E2() [9, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-A4() [8, 20]
		MEETS {
			Idle();

		}

		VALUE _pickplace-I1() [7, 25]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-F2();
			 _pickplace-H4();
			 _pickplace-F1();
			 _pickplace-H3();
			 _pickplace-J5();
			 _pickplace-H2();
			 _pickplace-J4();
			 _pickplace-H1();
			 _pickplace-J3();
			 _pickplace-B2();
			 _pickplace-D4();
			 _pickplace-D3();
			 _pickplace-F5();
			 _pickplace-D2();
			 _pickplace-F4();
			 _pickplace-D1();
			 _pickplace-F3();
			 _pickplace-H5();
			 _pickplace-B4();
			 _pickplace-D5();
			 _pickplace-J2();
			 _pickplace-J1();
			 _pickplace-I5();
			 _pickplace-E1();
			 _pickplace-G3();
			 _pickplace-I4();
			 _pickplace-G2();
			 _pickplace-G1();
			 _pickplace-I3();
			 _pickplace-I2();
			 _pickplace-E5();
			 _pickplace-C2();
			 _pickplace-E4();
			 _pickplace-G5();
			 _pickplace-E3();
			 _pickplace-G4();
			 _pickplace-E2();
			 _pickplace-A4();
			 _pickplace-I1();
		}

	}

	COMP_TYPE SingletonStateVariable RobotAgentType (_pickplace-F2(), _pickplace-F1(), _pickplace-H3(), _pickplace-J5(), _pickplace-H2(), _pickplace-J4(), _pickplace-H1(), _pickplace-J3(), _pickplace-B2(), _pickplace-D4(), _pickplace-B1(), _pickplace-D3(), _pickplace-D2(), _pickplace-D1(), _pickplace-F3(), _pickplace-B5(), _pickplace-B4(), _pickplace-B3(), _pickplace-D5(), _pickplace-J2(), _pickplace-J1(), _pickplace-I5(), _pickplace-I4(), _pickplace-G1(), _pickplace-A1(), _pickplace-C3(), _pickplace-E5(), _pickplace-C2(), _pickplace-E4(), _pickplace-C1(), _pickplace-G5(), _pickplace-G4(), _pickplace-A5(), _pickplace-A4(), _pickplace-A3(), _pickplace-C5(), _pickplace-A2(), _pickplace-C4(),  Idle() ) {

		VALUE _pickplace-F2() [11, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-F1() [13, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H3() [13, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J5() [8, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H2() [13, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J4() [8, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-H1() [12, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J3() [10, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-B2() [12, 30]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D4() [9, 34]
		MEETS {
			Idle();

		}

		VALUE _pickplace-B1() [14, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D3() [10, 30]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D2() [11, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D1() [12, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-F3() [10, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-B5() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-B4() [4, 39]
		MEETS {
			Idle();

		}

		VALUE _pickplace-B3() [14, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-D5() [12, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J2() [9, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-J1() [9, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-I5() [11, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-I4() [8, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G1() [11, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-A1() [15, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-C3() [13, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-E5() [11, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-C2() [13, 30]
		MEETS {
			Idle();

		}

		VALUE _pickplace-E4() [12, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-C1() [14, 24]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G5() [13, 27]
		MEETS {
			Idle();

		}

		VALUE _pickplace-G4() [10, 29]
		MEETS {
			Idle();

		}

		VALUE _pickplace-A5() [13, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-A4() [14, 33]
		MEETS {
			Idle();

		}

		VALUE _pickplace-A3() [12, 28]
		MEETS {
			Idle();

		}

		VALUE _pickplace-C5() [10, 26]
		MEETS {
			Idle();

		}

		VALUE _pickplace-A2() [15, 25]
		MEETS {
			Idle();

		}

		VALUE _pickplace-C4() [12, 25]
		MEETS {
			Idle();

		}

		VALUE Idle() [1, +INF]
		MEETS {

			 _pickplace-F2();
			 _pickplace-F1();
			 _pickplace-H3();
			 _pickplace-J5();
			 _pickplace-H2();
			 _pickplace-J4();
			 _pickplace-H1();
			 _pickplace-J3();
			 _pickplace-B2();
			 _pickplace-D4();
			 _pickplace-B1();
			 _pickplace-D3();
			 _pickplace-D2();
			 _pickplace-D1();
			 _pickplace-F3();
			 _pickplace-B5();
			 _pickplace-B4();
			 _pickplace-B3();
			 _pickplace-D5();
			 _pickplace-J2();
			 _pickplace-J1();
			 _pickplace-I5();
			 _pickplace-I4();
			 _pickplace-G1();
			 _pickplace-A1();
			 _pickplace-C3();
			 _pickplace-E5();
			 _pickplace-C2();
			 _pickplace-E4();
			 _pickplace-C1();
			 _pickplace-G5();
			 _pickplace-G4();
			 _pickplace-A5();
			 _pickplace-A4();
			 _pickplace-A3();
			 _pickplace-C5();
			 _pickplace-A2();
			 _pickplace-C4();
		}

	}

	COMPONENT Goal { FLEXIBLE hrc(functional) } : GoalType;
	COMPONENT Mosaic { FLEXIBLE process(functional) } : MosaicProcessType;
	COMPONENT Assembly { FLEXIBLE coordination(functional) } : AssemblyProcessType;
	COMPONENT Robot { FLEXIBLE task(primitive) } : RobotAgentType;
	COMPONENT Human { FLEXIBLE operation(primitive) } : HumanAgentType;


	SYNCHRONIZE Goal.hrc {

		VALUE DoMosaic() {

			r0 Mosaic.process.DoRow1();
			CONTAINS [0, +INF] [0, +INF] r0;

			r1 Mosaic.process.DoRow2();
			CONTAINS [0, +INF] [0, +INF] r1;

			r2 Mosaic.process.DoRow3();
			CONTAINS [0, +INF] [0, +INF] r2;

			r3 Mosaic.process.DoRow4();
			CONTAINS [0, +INF] [0, +INF] r3;

			r4 Mosaic.process.DoRow5();
			CONTAINS [0, +INF] [0, +INF] r4;

		}
	}

	SYNCHRONIZE Mosaic.process {

		VALUE DoRow1() {

			d0 Assembly.coordination.DoCellA1();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoCellB1();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoCellC1();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoCellD1();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoCellE1();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoCellF1();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoCellG1();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoCellH1();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoCellI1();
			CONTAINS [0, +INF] [0, +INF] d8;

			d9 Assembly.coordination.DoCellJ1();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoRow2() {

			d0 Assembly.coordination.DoCellA2();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoCellB2();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoCellC2();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoCellD2();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoCellE2();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoCellF2();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoCellG2();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoCellH2();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoCellI2();
			CONTAINS [0, +INF] [0, +INF] d8;

			d9 Assembly.coordination.DoCellJ2();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoRow3() {

			d0 Assembly.coordination.DoCellA3();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoCellB3();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoCellC3();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoCellD3();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoCellE3();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoCellF3();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoCellG3();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoCellH3();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoCellI3();
			CONTAINS [0, +INF] [0, +INF] d8;

			d9 Assembly.coordination.DoCellJ3();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoRow4() {

			d0 Assembly.coordination.DoCellA4();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoCellB4();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoCellC4();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoCellD4();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoCellE4();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoCellF4();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoCellG4();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoCellH4();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoCellI4();
			CONTAINS [0, +INF] [0, +INF] d8;

			d9 Assembly.coordination.DoCellJ4();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoRow5() {

			d0 Assembly.coordination.DoCellA5();
			CONTAINS [0, +INF] [0, +INF] d0;

			d1 Assembly.coordination.DoCellB5();
			CONTAINS [0, +INF] [0, +INF] d1;

			d2 Assembly.coordination.DoCellC5();
			CONTAINS [0, +INF] [0, +INF] d2;

			d3 Assembly.coordination.DoCellD5();
			CONTAINS [0, +INF] [0, +INF] d3;

			d4 Assembly.coordination.DoCellE5();
			CONTAINS [0, +INF] [0, +INF] d4;

			d5 Assembly.coordination.DoCellF5();
			CONTAINS [0, +INF] [0, +INF] d5;

			d6 Assembly.coordination.DoCellG5();
			CONTAINS [0, +INF] [0, +INF] d6;

			d7 Assembly.coordination.DoCellH5();
			CONTAINS [0, +INF] [0, +INF] d7;

			d8 Assembly.coordination.DoCellI5();
			CONTAINS [0, +INF] [0, +INF] d8;

			d9 Assembly.coordination.DoCellJ5();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

	}

	SYNCHRONIZE Assembly.coordination {

		VALUE DoCellA1() {

			d0 Robot.task._pickplace-A1();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoCellB1() {

			d1 Robot.task._pickplace-B1();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoCellC1() {

			d2 Robot.task._pickplace-C1();
			CONTAINS [0, +INF] [0, +INF] d2;

		}

		VALUE DoCellD1() {

			d3 Robot.task._pickplace-D1();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellD1() {

			d3 Human.operation._pickplace-D1();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellE1() {

			d4 Human.operation._pickplace-E1();
			CONTAINS [0, +INF] [0, +INF] d4;

		}

		VALUE DoCellF1() {

			d5 Robot.task._pickplace-F1();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellF1() {

			d5 Human.operation._pickplace-F1();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellG1() {

			d6 Robot.task._pickplace-G1();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellG1() {

			d6 Human.operation._pickplace-G1();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellH1() {

			d7 Robot.task._pickplace-H1();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellH1() {

			d7 Human.operation._pickplace-H1();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellI1() {

			d8 Human.operation._pickplace-I1();
			CONTAINS [0, +INF] [0, +INF] d8;

		}

		VALUE DoCellJ1() {

			d9 Robot.task._pickplace-J1();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellJ1() {

			d9 Human.operation._pickplace-J1();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellA2() {

			d0 Robot.task._pickplace-A2();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoCellB2() {

			d1 Robot.task._pickplace-B2();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoCellB2() {

			d1 Human.operation._pickplace-B2();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoCellC2() {

			d2 Robot.task._pickplace-C2();
			CONTAINS [0, +INF] [0, +INF] d2;

		}

		VALUE DoCellC2() {

			d2 Human.operation._pickplace-C2();
			CONTAINS [0, +INF] [0, +INF] d2;

		}

		VALUE DoCellD2() {

			d3 Robot.task._pickplace-D2();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellD2() {

			d3 Human.operation._pickplace-D2();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellE2() {

			d4 Human.operation._pickplace-E2();
			CONTAINS [0, +INF] [0, +INF] d4;

		}

		VALUE DoCellF2() {

			d5 Robot.task._pickplace-F2();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellF2() {

			d5 Human.operation._pickplace-F2();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellG2() {

			d6 Human.operation._pickplace-G2();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellH2() {

			d7 Robot.task._pickplace-H2();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellH2() {

			d7 Human.operation._pickplace-H2();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellI2() {

			d8 Human.operation._pickplace-I2();
			CONTAINS [0, +INF] [0, +INF] d8;

		}

		VALUE DoCellJ2() {

			d9 Robot.task._pickplace-J2();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellJ2() {

			d9 Human.operation._pickplace-J2();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellA3() {

			d0 Robot.task._pickplace-A3();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoCellB3() {

			d1 Robot.task._pickplace-B3();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoCellC3() {

			d2 Robot.task._pickplace-C3();
			CONTAINS [0, +INF] [0, +INF] d2;

		}

		VALUE DoCellD3() {

			d3 Robot.task._pickplace-D3();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellD3() {

			d3 Human.operation._pickplace-D3();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellE3() {

			d4 Human.operation._pickplace-E3();
			CONTAINS [0, +INF] [0, +INF] d4;

		}

		VALUE DoCellF3() {

			d5 Robot.task._pickplace-F3();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellF3() {

			d5 Human.operation._pickplace-F3();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellG3() {

			d6 Human.operation._pickplace-G3();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellH3() {

			d7 Robot.task._pickplace-H3();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellH3() {

			d7 Human.operation._pickplace-H3();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellI3() {

			d8 Human.operation._pickplace-I3();
			CONTAINS [0, +INF] [0, +INF] d8;

		}

		VALUE DoCellJ3() {

			d9 Robot.task._pickplace-J3();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellJ3() {

			d9 Human.operation._pickplace-J3();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellA4() {

			d0 Robot.task._pickplace-A4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoCellA4() {

			d0 Human.operation._pickplace-A4();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoCellB4() {

			d1 Robot.task._pickplace-B4();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoCellB4() {

			d1 Human.operation._pickplace-B4();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoCellC4() {

			d2 Robot.task._pickplace-C4();
			CONTAINS [0, +INF] [0, +INF] d2;

		}

		VALUE DoCellD4() {

			d3 Robot.task._pickplace-D4();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellD4() {

			d3 Human.operation._pickplace-D4();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellE4() {

			d4 Robot.task._pickplace-E4();
			CONTAINS [0, +INF] [0, +INF] d4;

		}

		VALUE DoCellE4() {

			d4 Human.operation._pickplace-E4();
			CONTAINS [0, +INF] [0, +INF] d4;

		}

		VALUE DoCellF4() {

			d5 Human.operation._pickplace-F4();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellG4() {

			d6 Robot.task._pickplace-G4();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellG4() {

			d6 Human.operation._pickplace-G4();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellH4() {

			d7 Human.operation._pickplace-H4();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellI4() {

			d8 Robot.task._pickplace-I4();
			CONTAINS [0, +INF] [0, +INF] d8;

		}

		VALUE DoCellI4() {

			d8 Human.operation._pickplace-I4();
			CONTAINS [0, +INF] [0, +INF] d8;

		}

		VALUE DoCellJ4() {

			d9 Robot.task._pickplace-J4();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellJ4() {

			d9 Human.operation._pickplace-J4();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellA5() {

			d0 Robot.task._pickplace-A5();
			CONTAINS [0, +INF] [0, +INF] d0;

		}

		VALUE DoCellB5() {

			d1 Robot.task._pickplace-B5();
			CONTAINS [0, +INF] [0, +INF] d1;

		}

		VALUE DoCellC5() {

			d2 Robot.task._pickplace-C5();
			CONTAINS [0, +INF] [0, +INF] d2;

		}

		VALUE DoCellD5() {

			d3 Robot.task._pickplace-D5();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellD5() {

			d3 Human.operation._pickplace-D5();
			CONTAINS [0, +INF] [0, +INF] d3;

		}

		VALUE DoCellE5() {

			d4 Robot.task._pickplace-E5();
			CONTAINS [0, +INF] [0, +INF] d4;

		}

		VALUE DoCellE5() {

			d4 Human.operation._pickplace-E5();
			CONTAINS [0, +INF] [0, +INF] d4;

		}

		VALUE DoCellF5() {

			d5 Human.operation._pickplace-F5();
			CONTAINS [0, +INF] [0, +INF] d5;

		}

		VALUE DoCellG5() {

			d6 Robot.task._pickplace-G5();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellG5() {

			d6 Human.operation._pickplace-G5();
			CONTAINS [0, +INF] [0, +INF] d6;

		}

		VALUE DoCellH5() {

			d7 Human.operation._pickplace-H5();
			CONTAINS [0, +INF] [0, +INF] d7;

		}

		VALUE DoCellI5() {

			d8 Robot.task._pickplace-I5();
			CONTAINS [0, +INF] [0, +INF] d8;

		}

		VALUE DoCellI5() {

			d8 Human.operation._pickplace-I5();
			CONTAINS [0, +INF] [0, +INF] d8;

		}

		VALUE DoCellJ5() {

			d9 Robot.task._pickplace-J5();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

		VALUE DoCellJ5() {

			d9 Human.operation._pickplace-J5();
			CONTAINS [0, +INF] [0, +INF] d9;

		}

	}


}

