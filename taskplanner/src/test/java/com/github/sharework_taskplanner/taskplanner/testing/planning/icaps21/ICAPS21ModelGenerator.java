package com.github.sharework_taskplanner.taskplanner.testing.planning.icaps21;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 
 * @author alessandroumbrico
 *
 */
public class ICAPS21ModelGenerator 
{
	private int uncertainty;
	private int rDMax;
	private int hDMax;
	private Random rand;
	private String folder;

	/**
	 *
	 * @param folder
	 * @param uncertainty
	 * @param rDMax
	 * @param hDMax
	 */
	protected ICAPS21ModelGenerator(String folder, int uncertainty, int rDMax, int hDMax) {
		this.folder = folder;
		this.rand = new Random(System.currentTimeMillis());
		this.uncertainty = uncertainty;
		this.rDMax = rDMax;
		this.hDMax = hDMax;
	}
	
	/**
	 * 
	 * @param row
	 * @param column
	 * @param bwo
	 * @param horizon
	 * @return
	 * @throws Exception
	 */
	public String[] generate(int row, int column, double[] bwo, int horizon) 
			throws Exception
	{
		// generate DDL 
		String ddl = this.generateDDL(row, column, bwo, horizon);
		// generat PDL
		String pdl = this.generatePDL(row, column, bwo, horizon);
		
		// number of total tasks 
		int total = row * column;
		// check percentage of assignable tasks
		long b = (long) (total * bwo[0]);
		// check the percentage of human tasks
		long w = (long) (total * bwo[1]);
		// check the percentage of robot tasks
		long o = (long) (total * bwo[2]);
		
		// check missing tasks
		if ((b + w + o) < total) {
			// get difference
			long diff = total - (b + w + o);
			// update shareable tasks
			b += diff;
		}
		
	
		// write DDL 
		File ddlFile = new File(this.folder + "/hrc_mosaic_gen_r" + row + "_c" + column + "_b" + b +"w" + w + "o" + o + ".ddl");
		try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(ddlFile), "UTF-8"))) {
			// write file content
			writer.write(ddl);
		}
		
		// writ PDL
		File pdlFile = new File(this.folder + "/hrc_mosaic_gen_r" + row + "_c" + column + "_b" + b + "w" + w + "o" + o + ".pdl");
		try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(pdlFile), "UTF-8"))) {
			// write file content
			writer.write(pdl);
		}
		
		// get file paths
		return new String[] {
			ddlFile.getAbsolutePath(),
			pdlFile.getAbsolutePath()
		};
	}
	
	
	/**
	 * 
	 * @param row
	 * @param column
	 * @param bwo
	 * @param horizon
	 * @return
	 */
	private String generateDDL(int row, int column, double[] bwo, int horizon) 
	{
		// number of total tasks 
		int total = row * column;
		// check percentage of assignable tasks
		long b = (long) (total * bwo[0]);
		// check the percentage of human tasks
		long w = (long) (total * bwo[1]);
		// check the percentage of robot tasks
		long o = (long) (total * bwo[2]);
		
		// check missing tasks
		if ((b + w + o) < total) {
			// get difference
			long diff = total - (b + w + o);
			// update shareable tasks
			b += diff;
		}

		
		// generate DDL file content
		String ddl = "DOMAIN ICAPS21_HRC_MOSAIC_R" + row + "_C" + column + "_B" + b + "W" + w + "O" + o +"  {\n\n";
		
		// add temporal module declaration
		ddl += "\tTEMPORAL_MODULE temporal_module = [0, " + horizon + "], 100;\n\n";
		
		// print process state variable
		ddl += "\tCOMP_TYPE SingletonStateVariable GoalType ( DoMosaic(), Idle() ) { \n\n"
				+ "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n"
				+ "\t\t\tDoMosaic();\n"
				+ "\t\t}\n\n"
				+ ""
				+ "\t\tVALUE DoMosaic() [1, +INF]\n"
				+ "\t\tMEETS {\n"
				+ "\t\t\tIdle();\n"
				+ "\t\t}\n\n";
		// close state variable
		ddl += "\t}\n\n";
		
		// print process row-level description
		ddl += "\tCOMP_TYPE SingletonStateVariable MosaicProcessType (";
		// add row description
		for (int i = 1; i <= row; i++) {
			ddl += " DoR" + i + "(), ";
		}
		ddl += " Idle() ) {\n\n";
		
		// add state transition
		for (int i = 1; i <= row; i++) {
			ddl += "\t\tVALUE DoR" + i + "() [1, +INF]\n"
					+ "\t\tMEETS {\n"
					+ "\t\t\tIdle();\n"
					+ "\t\t}\n\n";
		}
		
		// last transition
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n";
		for (int i = 1; i <= row; i++) {
			ddl += "\t\t\t DoR" + i + "();\n";
		}
		ddl += "\t\t}\n\n";
		
		// close state variable
		ddl += "\t}\n\n";
		
		
		
		// print process cell-level description
		ddl += "\tCOMP_TYPE SingletonStateVariable AssemblyProcessType (";
		// add cell description
		for (int i = 1; i <= row; i++) {
			for (int j = 1; j <= column; j++) {
				ddl += " DoR" + i + "C" + j + "(), ";
			}
		}
		ddl += " Idle() ) {\n\n";
		
		// add state transition
		for (int i = 1; i <= row; i++) {
			for (int j = 1; j <= column; j++) {
				ddl += "\t\tVALUE DoR" + i + "C" + j + "() [1, +INF]\n"
						+ "\t\tMEETS {\n"
						+ "\t\t\tIdle();\n"
						+ "\t\t}\n\n";
			}
		}
		
		// last transition
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n";
		
		for (int i = 1; i <= row; i++) {
			for (int j = 1; j <= column; j++) {
				ddl += "\t\t\t DoR" + i + "C" + j + "();\n";
			}
		}
		ddl += "\t\t}\n\n";
		
		// close state variable
		ddl += "\t}\n\n";
		
		
		
		// print human agent task description
		ddl += "\tCOMP_TYPE SingletonStateVariable HumanAgentType (";
		
		
		// add human task
		for (int i = 1; i <= row; i++) 
		{
			for (int j = 1; j <= column; j++) 
			{
				// get task name
				String taskName = "pickplace-R" + i + "C" + j;
				// add task description
				ddl += " _" + taskName + "(), ";
			}
			
		}
		
		ddl += " Idle() ) {\n\n";
		
		
		
		// add human task
		for (int i = 1; i <= row; i++) 
		{
			for (int j = 1; j <= column; j++) 
			{
				// get task name
				String taskName = "pickplace-R" + i + "C" + j;
				
				
				
				
				// randomly compute a duration
				int hd = this.rand.nextInt(this.hDMax);
				// set lower and upper bounds
				int[] duration = new int[] {
						Math.max(1, hd - this.uncertainty),
						hd + this.uncertainty
				};
				
				// add human task description 
				ddl += "\t\tVALUE _" + taskName + "() [" + duration[0] + ", " + duration[1] + "]\n"
						+ "\t\tMEETS {\n"
						+ "\t\t\tIdle();\n\n"
						+ "\t\t}\n\n";
			}
			
		}
		
		// add last transitions
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n\n";
		
		for (int i = 1; i <= row; i++) 
		{
			for (int j = 1; j <= column; j++) 
			{
				// get task name
				String taskName = "pickplace-R" + i + "C" + j;
				// add task description
				ddl += "\t\t\t _" + taskName + "();\n";
			}
			
		}

		
		// close last transition
		ddl += "\t\t}\n\n";
		
		// close state variable 
		ddl += "\t}\n\n";
		
		
		
		
		// print robot agent task description
		ddl += "\tCOMP_TYPE SingletonStateVariable RobotAgentType (";
		
		// add human task
		for (int i = 1; i <= row; i++) 
		{
			for (int j = 1; j <= column; j++) 
			{
				// get task name
				String taskName = "pickplace-R" + i + "C" + j;
				// add task description
				ddl += " _" + taskName + "(), ";
			}
			
		}
		
		ddl += " Idle() ) {\n\n";
		
		// add human task
		for (int i = 1; i <= row; i++) 
		{
			for (int j = 1; j <= column; j++) 
			{
				// get task name
				String taskName = "pickplace-R" + i + "C" + j;
				
				// randomly compute a duration
				int rd = this.rand.nextInt(this.rDMax);
				// set lower and upper bounds
				int[] duration = new int[] {
						Math.max(1, rd - this.uncertainty),
						rd + this.uncertainty
				};
				
				// add human task description 
				ddl += "\t\tVALUE _" + taskName + "() [" + duration[0] + ", " + duration[1] + "]\n"
						+ "\t\tMEETS {\n"
						+ "\t\t\tIdle();\n\n"
						+ "\t\t}\n\n";
			}
			
		}
		
		// add last transitions
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n\n";
		
		for (int i = 1; i <= row; i++) 
		{
			for (int j = 1; j <= column; j++) 
			{
				// get task name
				String taskName = "pickplace-R" + i + "C" + j;
				// add task description
				ddl += "\t\t\t _" + taskName + "();\n";
			}
			
		}

		
		// close last transition
		ddl += "\t\t}\n\n";
		
		// close state variable 
		ddl += "\t}\n\n";
		
		
		
		
		
		// add component declarations
		ddl += "\tCOMPONENT Goal { FLEXIBLE hrc(functional) } : GoalType;\n";
		ddl += "\tCOMPONENT Mosaic { FLEXIBLE process(functional) } : MosaicProcessType;\n";
		ddl += "\tCOMPONENT Assembly { FLEXIBLE coordination(functional) } : AssemblyProcessType;\n";
		ddl += "\tCOMPONENT Robot { FLEXIBLE task(primitive) } : RobotAgentType;\n";
		ddl += "\tCOMPONENT Human { FLEXIBLE operation(primitive) } : HumanAgentType;\n";
		
		ddl += "\n\n";
		
		// add synchronization for goal decomposition
		ddl += "\tSYNCHRONIZE Goal.hrc {\n\n"
				+ "\t\tVALUE DoMosaic() {\n\n";
		
		int dCounter = 0;
		for (int i = 1; i <= row; i++) {
			
			// add decision
			ddl += "\t\t\tr" + dCounter + " Mosaic.process.DoR" + i + "();\n"
					+ "\t\t\tCONTAINS [0, +INF] [0, +INF] r"+ dCounter + ";\n\n";
			// increment counter
			dCounter++;
		}
		
		// close value synch
		ddl += "\t\t}\n";
		// close synch
		ddl += "\t}\n\n";
				
				
		
		// add synchronization for process decomposition
		ddl += "\tSYNCHRONIZE Mosaic.process {\n\n";
				
		for (int i = 1; i <= row; i++) {
			
			// add synch for row decomposition
			ddl += "\t\tVALUE DoR" + i + "() {\n\n";
			
			// dec counter
			int counter = 0;
			for (int j = 1; j <= column; j++) {
				
				// add decision
				ddl += "\t\t\td" + counter + " Assembly.coordination.DoR" + i + "C" + j + "();\n"
						+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d" + counter + ";\n\n";
				// increment counter
				counter++;
				
				
			}
			
			
			// close synch
			ddl += "\t\t}\n\n";
			
		}
		
		// close synch
		ddl += "\t}\n\n";
		
		
		
		// prepare the list of cells
		List<String> cells = new ArrayList<>();
		for (int i= 1; i <= row; i++) {
			for (int j = 1; j <= column; j++) {
				// add task
				cells.add("R"+ i + "C" + j);
			}
		}
		
		
		// add synchronization for agent coordination
		ddl += "\tSYNCHRONIZE Assembly.coordination {\n\n";
		
		
		// randomly set cells that can be performed by both
		for (int i = 0; i < b; i++) 
		{
			// get a random index
			int index = this.rand.nextInt(cells.size());
			// randomly remove a cell
			String cell = cells.remove(index);
			
			
			// add robot implementation
			ddl += "\t\tVALUE " + "Do" + cell + "() {\n\n";
			// add decision
			ddl += "\t\t\td0 Robot.task._pickplace-" + cell + "();\n"
					+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n\n";
			
			// close constraints block
			ddl += "\t\t}\n\n";
			
			
			// add human implementation
			ddl += "\t\tVALUE " + "Do" + cell + "() {\n\n";
			// add decision
			ddl += "\t\t\td0 Human.operation._pickplace-" + cell + "();\n"
					+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n\n";
			
			// close constraints block
			ddl += "\t\t}\n\n";
		}
		
		
		// randomly set cells that can be performed by human only
		for (int i = 0; i < w; i++) 
		{
			// get a random index
			int index = this.rand.nextInt(cells.size());
			// randomly remove a cell
			String cell = cells.remove(index);
			
			// add human implementation
			ddl += "\t\tVALUE " + "Do" + cell + "() {\n\n";
			// add decision
			ddl += "\t\t\td0 Human.operation._pickplace-" + cell + "();\n"
					+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n\n";
			
			// close constraints block
			ddl += "\t\t}\n\n";
		}
		
		
		// randomly set cells that can be performed by robot only
		for (int i = 0; i < o; i++) 
		{
			// get a random index
			int index = this.rand.nextInt(cells.size());
			// randomly remove a cell
			String cell = cells.remove(index);
			
			// add human implementation
			ddl += "\t\tVALUE " + "Do" + cell + "() {\n\n";
			// add decision
			ddl += "\t\t\td0 Robot.task._pickplace-" + cell + "();\n"
					+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d0;\n\n";
			
			// close constraints block
			ddl += "\t\t}\n\n";
		}
		
		

		// close synch
		ddl += "\t}\n\n";

		// close DDL  
		ddl += "\n}\n\n";
		// get ddl 
		return ddl;
	}


	/**
	 * 
	 * @param row
	 * @param column
	 * @param bwo
	 * @param horizon
	 * @return
	 */
	private String generatePDL(int row, int column, double[] bwo, int horizon) 
	{
		// number of total tasks 
		int total = row * column;
		// check percentage of assignable tasks
		long b = (long) (total * bwo[0]);
		// check the percentage of human tasks
		long w = (long) (total * bwo[1]);
		// check the percentage of robot tasks
		long o = (long) (total * bwo[2]);
		
		// check missing tasks
		if ((b + w + o) < total) {
			// get difference
			long diff = total - (b + w + o);
			// update shareable tasks
			b += diff;
		}
				
		// set model
		String pdl = "PROBLEM ICAPS21_HRC_MOSAIC_R" + row + "_C" + column + "_B" + b + "W" + w + "O" + o + "_PROB (DOMAIN ICAPS21_HRC_MOSAIC_R" + row + "_C" + column + "_B" + b + "W" + w + "O" + o + ") {\n\n";
		
		// goal counter
		int gCounter = 0;
		// add a goal 
		pdl += "\tg" + gCounter + " <goal> Goal.hrc.DoMosaic() AT [0, " + horizon + "] [0, " + horizon + "] [0, " + horizon + "];\n";
		
		// close problem description
		pdl += "\n}\n\n";
		
		// get PDL
		return pdl;
		
	}

}
