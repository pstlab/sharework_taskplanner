DOMAIN CYBERNETICS_4x4
{
	TEMPORAL_MODULE temporal_module = [0, 7000], 100;

	PAR_TYPE NumericParameterType rows = [1, 5];

	PAR_TYPE EnumerationParameterType columns = {
		A, B, C, D, E, F, G, H, I, J
	};

	PAR_TYPE EnumerationParameterType configurations = {
		box_orange, box_blue, box_white,
		A1, A2, A3, A4,
		B1, B2, B3, B4,
		C1, C2, C3, C4,
		D1, D2, D3, D4
	};

	PAR_TYPE NumericParameterType risk_levels = [0, 5];


	COMP_TYPE SingletonStateVariable ProcessType (
		Idle(), DoMosaic())
	{
		VALUE Idle() [1, +INF]
		MEETS {
			DoMosaic();
		}

		VALUE DoMosaic() [1, +INF]
		MEETS {
			Idle();
		}
	}

	COMP_TYPE SingletonStateVariable MosaicProcessType(
		Idle(), DoRow1(), DoRow2(), DoRow3(), DoRow4())
	{
		VALUE Idle() [1, +INF]
		MEETS {
			DoRow1();
			DoRow2();
			DoRow3();
			DoRow4();
		}

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
	}

	COMP_TYPE SingletonStateVariable AssemblyProcessType(
		Idle(),
		DoCellA1(), DoCellB1(), DoCellC1(), DoCellD1(),
		DoCellA2(), DoCellB2(), DoCellC2(), DoCellD2(),
		DoCellA3(), DoCellB3(), DoCellC3(), DoCellD3(),
		DoCellA4(), DoCellB4(), DoCellC4(), DoCellD4())
	{
		VALUE Idle() [1, +INF]
		MEETS {
			DoCellA1(); DoCellB1(); DoCellC1(); DoCellD1();
			DoCellA2(); DoCellB2(); DoCellC2(); DoCellD2();
			DoCellA3(); DoCellB3(); DoCellC3(); DoCellD3();
			DoCellA4(); DoCellB4(); DoCellC4(); DoCellD4();
		}

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
	}

	COMP_TYPE SingletonStateVariable AgentBehaviorType(
		Idle(), _PickPlace(configurations, configurations, risk_levels))
	{
		VALUE Idle() [1, +INF]
		MEETS {
			_PickPlace(?start, ?goal, ?risk);
		}

		VALUE _PickPlace(?start, ?goal, ?risk) [18, 23]
		MEETS {
			Idle();
		}
	}

	COMP_TYPE SingletonStateVariable SharableAreaType(Free(), Human(), Robot())
	{
		VALUE Free() [1, +INF]
		MEETS {
			Human();
			Robot();
		}

		VALUE Human() [1, +INF]
		MEETS {
			Free();
		}

		VALUE Robot() [1, +INF]
		MEETS {
			Free();
		}
	}

	COMPONENT Goal {FLEXIBLE hrc(functional)} : ProcessType;
	COMPONENT Mosaic {FLEXIBLE tasks(functional)} : MosaicProcessType;
	COMPONENT Assembly {FLEXIBLE coordination(functional)} : AssemblyProcessType;
	COMPONENT Worker {FLEXIBLE operations(primitive)} : AgentBehaviorType;
	COMPONENT Cobot {FLEXIBLE commands(primitive)} : AgentBehaviorType;
	//COMPONENT BlueBoxArea {FLEXIBLE state(primitive)} : SharableAreaType;

	SYNCHRONIZE Goal.hrc
	{
		VALUE DoMosaic()
		{
			r1  Mosaic.tasks.DoRow1();
			r2  Mosaic.tasks.DoRow2();
			r3  Mosaic.tasks.DoRow3();
			r4  Mosaic.tasks.DoRow4();

			CONTAINS [0, +INF] [0, +INF] r1;
			CONTAINS [0, +INF] [0, +INF] r2;
			CONTAINS [0, +INF] [0, +INF] r3;
			CONTAINS [0, +INF] [0, +INF] r4;
		}
	}


	SYNCHRONIZE Mosaic.tasks
	{
		VALUE DoRow1()
		{
			t0 Assembly.coordination.DoCellA1();
			t1 Assembly.coordination.DoCellB1();
			t2 Assembly.coordination.DoCellC1();
			t3 Assembly.coordination.DoCellD1();

			CONTAINS [0, +INF] [0, +INF] t0;
			CONTAINS [0, +INF] [0, +INF] t1;
			CONTAINS [0, +INF] [0, +INF] t2;
			CONTAINS [0, +INF] [0, +INF] t3;
		}

		VALUE DoRow2()
		{
			t0 Assembly.coordination.DoCellA2();
			t1 Assembly.coordination.DoCellB2();
			t2 Assembly.coordination.DoCellC2();
			t3 Assembly.coordination.DoCellD2();

			CONTAINS [0, +INF] [0, +INF] t0;
			CONTAINS [0, +INF] [0, +INF] t1;
			CONTAINS [0, +INF] [0, +INF] t2;
			CONTAINS [0, +INF] [0, +INF] t3;
		}

		VALUE DoRow3()
		{
			t0 Assembly.coordination.DoCellA3();
			t1 Assembly.coordination.DoCellB3();
			t2 Assembly.coordination.DoCellC3();
			t3 Assembly.coordination.DoCellD3();

			CONTAINS [0, +INF] [0, +INF] t0;
			CONTAINS [0, +INF] [0, +INF] t1;
			CONTAINS [0, +INF] [0, +INF] t2;
			CONTAINS [0, +INF] [0, +INF] t3;
		}

		VALUE DoRow4()
		{
			t0 Assembly.coordination.DoCellA4();
			t1 Assembly.coordination.DoCellB4();
			t2 Assembly.coordination.DoCellC4();
			t3 Assembly.coordination.DoCellD4();


			CONTAINS [0, +INF] [0, +INF] t0;
			CONTAINS [0, +INF] [0, +INF] t1;
			CONTAINS [0, +INF] [0, +INF] t2;
			CONTAINS [0, +INF] [0, +INF] t3;
		}
	}

	SYNCHRONIZE Assembly.coordination
	{
		// cells of row 1

		VALUE DoCellA1()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = A1;
			?risk = 1;
		}

		VALUE DoCellB1()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = B1;
			?risk = 1;
		}

		VALUE DoCellC1()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = C1;
			?risk = 2;
		}

		// robot
		VALUE DoCellD1()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2	BlueBoxArea.state.Robot();


			CONTAINS [0, +INF] [0, +INF] t1;
			//DURING [0, +INF] [0, +INF] t2;


			?start = box_blue;
			?goal = D1;
			?risk = 3;
		}

		// human
		VALUE DoCellD1()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			CONTAINS [0, +INF] [0, +INF] t1;
			//DURING [0, +INF] [0, +INF] t2;

			?start = box_blue;
			?goal = D1;
			?risk = 0;
		}

		// cells of row 2

		VALUE DoCellA2()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = A2;
			?risk = 1;
		}

		// robot
		VALUE DoCellB2()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Robot();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = B2;
			?risk = 1;
		}

		// human
		VALUE DoCellB2()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = B2;
			?risk = 0;
		}

		// robot
		VALUE DoCellC2()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Robot();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = C2;
			?risk = 1;
		}

		// human
		VALUE DoCellC2()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = C2;
			?risk = 0;
		}


		// robot
		VALUE DoCellD2()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Robot();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = D2;
			?risk = 3;
		}

		// human
		VALUE DoCellD2()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = D2;
			?risk = 0;
		}

		// cells of row 3


		VALUE DoCellA3()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = A3;
			?risk = 1;
		}

		VALUE DoCellB3()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = B3;
			?risk = 1;
		}

		VALUE DoCellC3()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = C3;
			?risk = 2;
		}

		// robot
		VALUE DoCellD3()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Robot();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = D3;
			?risk = 3;
		}

		// human
		VALUE DoCellD3()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = D3;
			?risk = 0;
		}

		// cells of row 4

		// robot
		VALUE DoCellA4()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Robot();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = A4;
			?risk = 1;
		}

		// human
		VALUE DoCellA4()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = A4;
			?risk = 0;
		}


		// robot
		VALUE DoCellB4()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Robot();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = B4;
			?risk = 1;
		}

		// human
		VALUE DoCellB4()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = B4;
			?risk = 0;
		}

		VALUE DoCellC4()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_orange;
			?goal = C4;
			?risk = 2;
		}

		// robot
		VALUE DoCellD4()
		{
			t1  Cobot.commands._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Robot();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = D4;
			?risk = 3;
		}

		// human
		VALUE DoCellD4()
		{
			t1  Worker.operations._PickPlace(?start, ?goal, ?risk);
			//t2 BlueBoxArea.state.Human();

			//DURING [0, +INF] [0, +INF] t2;

			CONTAINS [0, +INF] [0, +INF] t1;

			?start = box_blue;
			?goal = D4;
			?risk = 0;
		}

	}

}
