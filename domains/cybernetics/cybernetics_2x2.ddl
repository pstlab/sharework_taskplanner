DOMAIN CYBERNETICS_2x2
{
	TEMPORAL_MODULE temporal_module = [0, 7000], 100;

	PAR_TYPE NumericParameterType rows = [1, 5];

	PAR_TYPE EnumerationParameterType columns = {
		A, B, C, D, E, F, G, H, I, J
	};

	PAR_TYPE EnumerationParameterType configurations = {
		box_orange, box_blue, box_white,
		A1, A2,
		B1, B2
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
		Idle(), DoRow1(), DoRow2())
	{
		VALUE Idle() [1, +INF]
		MEETS {
			DoRow1();
			DoRow2();
		}

		VALUE DoRow1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoRow2() [1, +INF]
		MEETS {
			Idle();
		}
	}

	COMP_TYPE SingletonStateVariable AssemblyProcessType(
		Idle(),
		DoCellA1(), DoCellB1(),
		DoCellA2(), DoCellB2())
	{
		VALUE Idle() [1, +INF]
		MEETS {
			DoCellA1(); DoCellB1();
			DoCellA2(); DoCellB2();
		}

		VALUE DoCellA1() [1, +INF]
		MEETS {
			Idle();
		}

		VALUE DoCellB1() [1, +INF]
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

			CONTAINS [0, +INF] [0, +INF] r1;
			CONTAINS [0, +INF] [0, +INF] r2;
		}
	}


	SYNCHRONIZE Mosaic.tasks
	{
		VALUE DoRow1()
		{
			t0 Assembly.coordination.DoCellA1();
			t1 Assembly.coordination.DoCellB1();

			CONTAINS [0, +INF] [0, +INF] t0;
			CONTAINS [0, +INF] [0, +INF] t1;
		}

		VALUE DoRow2()
		{
			t0 Assembly.coordination.DoCellA2();
			t1 Assembly.coordination.DoCellB2();

			CONTAINS [0, +INF] [0, +INF] t0;
			CONTAINS [0, +INF] [0, +INF] t1;
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

	}

}
