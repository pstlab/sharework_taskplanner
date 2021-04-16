package com.github.sharework_taskplanner.taskplanner.dom.mosaic;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashSet;
import java.util.Set;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import it.cnr.istc.pst.platinum.ai.framework.utils.properties.FilePropertyReader;

/**
 * 
 * @author alessandroumbrico
 *
 */
public class MosaicModelGenerator 
{
	private static final String OUTPUT_FOLDER = "domains";
	private static int HORIZON = 7000;
	
	
	private String mongoDb;
	private String mongoCollection;
	
	private double kRobot;							// coefficient k concerning the uncertainty about robot tasks
	private double kHuman;							// coefficient k concerning the uncertainty about human tasks
	
	
	private static String[] ROWS = new String[] { 
		"DoRow1", "DoRow2", "DoRow3", "DoRow4", "DoRow5"
	};
	
	private static String[][] CELLS = {
			
		// row 1
		{"DoCellA1", "DoCellB1", "DoCellC1", "DoCellD1", "DoCellE1", "DoCellF1", "DoCellG1", "DoCellH1", "DoCellI1", "DoCellJ1"},
		
		// row 2
		{"DoCellA2", "DoCellB2", "DoCellC2", "DoCellD2", "DoCellE2", "DoCellF2", "DoCellG2", "DoCellH2", "DoCellI2", "DoCellJ2"},
		
		// row 3
		{ "DoCellA3", "DoCellB3", "DoCellC3", "DoCellD3", "DoCellE3", "DoCellF3", "DoCellG3", "DoCellH3", "DoCellI3", "DoCellJ3" },
		
		// row 4
		{ "DoCellA4", "DoCellB4", "DoCellC4", "DoCellD4", "DoCellE4", "DoCellF4", "DoCellG4", "DoCellH4", "DoCellI4", "DoCellJ4" },
		
		// row 5
		{ "DoCellA5", "DoCellB5", "DoCellC5", "DoCellD5", "DoCellE5", "DoCellF5", "DoCellG5", "DoCellH5", "DoCellI5", "DoCellJ5" }
			
	};
	
	private String ddlFilePath;
	private String pdlFilePath;
	
	/**
	 * 
	 * @param ddlFile
	 * @param pdlFile
	 */
	public MosaicModelGenerator(String ddlFile, String pdlFile) {
		this.ddlFilePath = OUTPUT_FOLDER + "/" + ddlFile;
		this.pdlFilePath = OUTPUT_FOLDER + "/" + pdlFile;
		
		// get deliberative property file
		FilePropertyReader properties = new FilePropertyReader("etc/gen.properties");
		// set db connection info
		this.mongoDb = properties.getProperty("mongo_db").trim();
		this.mongoCollection = properties.getProperty("mongo_collection").trim();
		
		// parse uncertainty coefficients
		this.kRobot = Double.parseDouble(properties.getProperty("k_robot").trim());
		this.kHuman = Double.parseDouble(properties.getProperty("k_human").trim());
	}
	
	
	/**
	 * 
	 */
	public MosaicModelGenerator() {
		this("/hrc_mosaic_gen.ddl", "/hrc_mosaic_gen.pdl");
	}
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String[] generate() 
			throws Exception 
	{
		// print model configuration generation 
		System.out.println("Model generation parameters:\n"
				+ "- Mongo DB: " + this.mongoDb + "\n"
				+ "- Mongo Collection: " + this.mongoCollection + "\n"
				+ "- K_Robot: " + this.kRobot + "\n"
				+ "- K_Human: " + this.kHuman + "\n");
		
		
		// set paths to DDL and PDL 
		String[] paths = new String[2];
		// connect to the DB
		MongoClient client = new MongoClient();
		try
		{
			// get dataset
			MongoDatabase db = client.getDatabase(this.mongoDb);
			// select collection
			MongoCollection<Document> collection = db.getCollection(this.mongoCollection);
			
			// generate DDL 
			String ddl = this.generateDDL(collection);
			// generat PDL
			String pdl = this.generatePDL();
		
			// write DDL 
			File ddlFile = new File(this.ddlFilePath);
			try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(ddlFile), "UTF-8"))) {
				// write file content
				writer.write(ddl);
			}
			
			// writ PDL
			File pdlFile = new File(this.pdlFilePath);
			try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(pdlFile), "UTF-8"))) {
				// write file content
				writer.write(pdl);
			}
			
			// set paths
			paths[0] = ddlFile.getAbsolutePath();
			paths[1] = pdlFile.getAbsolutePath();
		}
		finally {
			// close connection with the client
			client.close();
		}
		
		// get paths
		return paths;
	}
	
	
	/**
	 * 
	 * @param args
	 */
	public static final void main(String[] args)
	{
		try 
		{
			// generate a model
			MosaicModelGenerator gen = new MosaicModelGenerator();
			gen.generate();
		}
		catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
	}
	
	
	/**
	 * 
	 * @param collection
	 * @return
	 */
	private String generateDDL(MongoCollection<Document> collection) {
		
		// generate DDL file content
		String ddl = "DOMAIN SHAREWORK_HRC_MOSAIC_GEN {\n\n";
		
		// add temporal module declaration
		ddl += "\tTEMPORAL_MODULE temporal_module = [0, " + HORIZON + "], 100;\n\n";
		
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
		for (String row : ROWS) {
			ddl += " " + row + "(), ";
		}
		ddl += " Idle() ) {\n\n";
		
		// add state transition
		for (String row : ROWS) {
			ddl += "\t\tVALUE " + row + "() [1, +INF]\n"
					+ "\t\tMEETS {\n"
					+ "\t\t\tIdle();\n"
					+ "\t\t}\n\n";
		}
		
		// last transition
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n";
		for (String row : ROWS) {
			ddl += "\t\t\t" + row + "();\n";
		}
		ddl += "\t\t}\n\n";
		
		// close state variable
		ddl += "\t}\n\n";
		
		
		
		// print process cell-level description
		ddl += "\tCOMP_TYPE SingletonStateVariable AssemblyProcessType (";
		// add cell description
		for (int i = 0; i < ROWS.length; i++) {
			// get cells fo the current row
			String[] cells = CELLS[i];
			for (String cell : cells) {
				ddl += " " + cell + "(), ";
			}
		}
		ddl += " Idle() ) {\n\n";
		
		// add state transition
		for (int i = 0; i < ROWS.length; i++) {
			// get cells fo the current row
			String[] cells = CELLS[i];
			for (String cell : cells) {
				ddl += "\t\tVALUE " + cell + "() [1, +INF]\n"
						+ "\t\tMEETS {\n"
						+ "\t\t\tIdle();\n"
						+ "\t\t}\n\n";
			}
		}
		
		// last transition
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n";
		
		for (int i = 0; i < ROWS.length; i++) {
			// get cells of the current row
			String[] cells = CELLS[i];
			for (String cell : cells) {
				ddl += "\t\t\t" + cell + "();\n";
			}
		}
		ddl += "\t\t}\n\n";
		
		// close state variable
		ddl += "\t}\n\n";
		
		
		
		// print human agent task description
		ddl += "\tCOMP_TYPE SingletonStateVariable HumanAgentType (";
		
		
		// get the list of tasks the human can do 
		Set<String> hTasks = new HashSet<>();
//		// prepare document filter
//		Bson hFilter = new Document("agent", "human_right_arm");
//		// query the collection
//		MongoCursor<Document> hCursor = collection.find(hFilter).iterator();
		MongoCursor<Document> hCursor = collection.find().iterator();
		while (hCursor.hasNext()) 
		{
			// get next
			Document doc = hCursor.next();
			// check if human task 
			if (doc.containsKey("human_right_arm_expected_duration")) {
				// get task name 
				String hTask = doc.getString("name").trim();
				// add task 
				hTasks.add(hTask);
			}
		}
		
		// close cursor
		hCursor.close();
		
		
		// setting human tasks
		for (String hTask : hTasks) {
			// add task declaration
			ddl += "_" + hTask + "(), ";
		}
		
		ddl += " Idle() ) {\n\n";
		
		
		
		// add human task
		for (String hTask : hTasks) 
		{
			// set default minimum and maximum duration
			long[] duration = new long[] {
					1,
					HORIZON
			};
			
			// prepare document filter
			Bson filter = new Document("name", hTask);
//					.append("agent", "human_right_arm");
			
			// query the collection
			MongoCursor<Document> cursor = collection.find(filter).iterator();
			// computer average duration
			double avgDuration = 0;
			double avgStddev = 0;
			long count = 0;
			while (cursor.hasNext()) 
			{
				// get next object
				Document doc = cursor.next();
				
				try
				{
					// get double
					avgDuration += doc.getDouble("human_right_arm_expected_duration");
				}
				catch (Exception ex) {
					// get interger duration
					avgDuration += doc.getInteger("human_right_arm_expected_duration");
				}
				
				try
				{
					// get double
					avgStddev += doc.getDouble("human_right_arm_duration_stddev");
				}
				catch (Exception ex) {
					// get interger duration
					avgStddev += doc.getInteger("human_right_arm_duration_stddev");
				}
				
				// increment 
				count++;
			}
				
				
			// check counter
			if (count > 0) 
			{
				// set average duration 
				avgDuration = avgDuration / count;
				// set average stddev
				avgStddev = avgStddev / count;
				
				
				
				// set duration lower bound by taking into account the expected uncertainty
				duration[0] = (long) Math.max(duration[0], avgDuration - (avgStddev * this.kHuman));
				// set duratio nupper bound by taking into account the expected uncertainty
				duration[1] = (long) Math.min(duration[1], avgDuration + (avgStddev * this.kHuman));
			}
			
			// close cursor
			cursor.close();
				
			// add human task description 
			ddl += "\t\tVALUE _" + hTask + "() [" + duration[0] + ", " + duration[1] + "]\n"
					+ "\t\tMEETS {\n"
					+ "\t\t\tIdle();\n\n"
					+ "\t\t}\n\n";
		}
		
		// add last transitions
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n\n";
		
		for (String hTask : hTasks) {
			// add task description
			ddl += "\t\t\t _" + hTask + "();\n";
		}

		
		// close last transition
		ddl += "\t\t}\n\n";
		
		// close state variable 
		ddl += "\t}\n\n";
		
		
		
		
		// print robot agent task description
		ddl += "\tCOMP_TYPE SingletonStateVariable RobotAgentType (";
		
		// get the list of tasks the human can do 
		Set<String> rTasks = new HashSet<>();
		// prepare document filter
//		Bson rFilter = new Document("agent", "ur5_on_guide");
		// query the collection
//		MongoCursor<Document> rCursor = collection.find(rFilter).iterator();
		MongoCursor<Document> rCursor = collection.find().iterator();
		while (rCursor.hasNext()) {
			// get next
			Document doc = rCursor.next();
			// check if human task 
			if (doc.containsKey("ur5_on_guide_expected_duration")) {
				// get task name 
				String rTask = doc.getString("name").trim();
				// add task 
				rTasks.add(rTask);
			}
		}
		
		// close cursor
		rCursor.close();
		
		
		// setting human tasks
		for (String rTask : rTasks) {
			// add task declaration
			ddl += "_" + rTask + "(), ";
		}
		
		ddl += " Idle() ) {\n\n";
		
		
		
		// add human task
		for (String rTask : rTasks) 
		{
			// set default minimum and maximum duration
			long[] duration = new long[] {
					1,
					HORIZON
			};
			
			// prepare document filter
			Bson filter = new Document("name", rTask);
//					.append("agent", "ur5_on_guide");
			
			// query the collection
			MongoCursor<Document> cursor = collection.find(filter).iterator();
			// computer average duration
			double avgDuration = 0;
			double avgStddev = 0;
			long count = 0;
			while (cursor.hasNext()) 
			{
				// get next object
				Document doc = cursor.next();
				try
				{
					// get double
					avgDuration += doc.getDouble("ur5_on_guide_expected_duration");
				}
				catch (Exception ex) {
					// get interger duration
					avgDuration += doc.getInteger("ur5_on_guide_expected_duration");
				}
				
				try
				{
					// get double
					avgStddev += doc.getDouble("ur5_on_guide_duration_stddev");
				}
				catch (Exception ex) {
					// get interger duration
					avgStddev += doc.getInteger("ur5_on_guide_duration_stddev");
				}
				
				// increment 
				count++;
			}
				
				
			// check counter
			if (count > 0) 
			{
				// set average duration 
				avgDuration = avgDuration / count;
				// set average stddev 
				avgStddev = avgStddev / count;
				
				// set duration lower bound by taking into account the expected uncertainty
				duration[0] = (long) Math.max(duration[0], avgDuration - (avgStddev * this.kRobot));
				// set duratio nupper bound by taking into account the expected uncertainty
				duration[1] = (long) Math.min(duration[1], avgDuration + (avgStddev * this.kRobot));
			}
			
			// close cursor
			cursor.close();
				
			// add human task description 
			ddl += "\t\tVALUE _" + rTask + "() [" + duration[0] + ", " + duration[1] + "]\n"
					+ "\t\tMEETS {\n"
					+ "\t\t\tIdle();\n\n"
					+ "\t\t}\n\n";
		}
		
		// add last transitions
		ddl += "\t\tVALUE Idle() [1, +INF]\n"
				+ "\t\tMEETS {\n\n";
		
		for (String rTask : rTasks) {
			// add task description
			ddl += "\t\t\t _" + rTask + "();\n";
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
		for (String row : ROWS) {
			
			// add decision
			ddl += "\t\t\tr" + dCounter + " Mosaic.process." + row + "();\n"
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
				
		for (int i = 0; i < ROWS.length; i++) {
			
			// get current row
			String row = ROWS[i];
			// add synch for row decomposition
			ddl += "\t\tVALUE " + row + "() {\n\n";
			
			// dec counter
			int counter = 0;
			// get cells
			String[] cells = CELLS[i];
			for (String cell : cells) {
				
				// add decision
				ddl += "\t\t\td" + counter + " Assembly.coordination." + cell + "();\n"
						+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d" + counter + ";\n\n";
				// increment counter
				counter++;
				
				
			}
			
			
			// close synch
			ddl += "\t\t}\n\n";
			
		}
		
		// close synch
		ddl += "\t}\n\n";
		
		// add synchronization for agent coordination
		ddl += "\tSYNCHRONIZE Assembly.coordination {\n\n";
		for (int i = 0; i < ROWS.length; i++) {
			
			// dec counter
			int counter = 0;
			// get cells
			String[] cells = CELLS[i];
			for (String cell : cells) 
			{
				// extract cell index
				String cIndex = cell.replace("DoCell", "").trim();
				
				// agent task
				String agentTask = "pickplace-" + cIndex;
				
				
				// check if the robot can perform the taks 
				if (rTasks.contains(agentTask)) 
				{
					// add synch costraint toward the robot
					ddl += "\t\tVALUE " + cell + "() {\n\n";
					// add decision
					ddl += "\t\t\td" + counter + " Robot.task._pickplace-" + cIndex + "();\n"
							+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d" + counter + ";\n\n";
					
					// close constraints block
					ddl += "\t\t}\n\n";
				}
				
				// check if the human can perform the task
				if (hTasks.contains(agentTask)) {
					
					// add synch costraint toward the human
					ddl += "\t\tVALUE " + cell + "() {\n\n";
					// add decision
					ddl += "\t\t\td" + counter + " Human.operation._pickplace-" + cIndex + "();\n"
							+ "\t\t\tCONTAINS [0, +INF] [0, +INF] d" + counter + ";\n\n";
					
					// close constraints block
					ddl += "\t\t}\n\n";
				}
				
				// increment counter
				counter++;
			}
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
	 * @return
	 */
	private String generatePDL() {
		
		// set model
		String pdl = "PROBLEM SHAREWORK_HRC_MOSAIC_PRO (DOMAIN SHAREWORK_HRC_MOSAIC_GEN) {\n\n";
		
		// goal counter
		int gCounter = 0;
		// add a goal 
		pdl += "\tg" + gCounter + " <goal> Goal.hrc.DoMosaic() AT [0, " + HORIZON + "] [0, " + HORIZON + "] [0, " + HORIZON + "];\n";
		
		// close problem description
		pdl += "\n}\n\n";
		
		// get PDL
		return pdl;
		
	}

}
