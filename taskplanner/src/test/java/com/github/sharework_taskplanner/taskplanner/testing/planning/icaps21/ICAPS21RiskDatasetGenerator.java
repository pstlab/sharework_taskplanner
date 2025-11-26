package com.github.sharework_taskplanner.taskplanner.testing.planning.icaps21;

import java.util.Random;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

/**
 * 
 * @author alessandroumbrico
 *
 */
public class ICAPS21RiskDatasetGenerator 
{
	private String db; 
	private String collection;
	
	private double riskMax;
	private int rows;
	private int columns;
	
	/**
	 * 
	 * @param db
	 * @param collection
	 * @param rows
	 * @param columns
	 * @param riskMax
	 */
	protected ICAPS21RiskDatasetGenerator(String db, String collection, int rows, int columns, double riskMax) {
		this.db = db; 
		this.collection = collection;
		this.riskMax = riskMax;
		this.rows = rows;
		this.columns = columns;
	}
	
	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try
		{
			// test risk generation procedure
			ICAPS21RiskDatasetGenerator riskGen = new ICAPS21RiskDatasetGenerator(
					"roxanne_icaps21", "hrc_risk_dynamics", 5, 10, 100);
			riskGen.generate();
		}
		catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
	}
	
	/**
	 * 
	 * @throws Exception
	 */
	public void generate() 
			throws Exception
	{
		// create a data-set
		MongoClient client = new MongoClient();
		try
		{
			// randomly compute a dynamic risk factor
			Random rand = new Random(System.currentTimeMillis());
					
			// get data-base
			MongoDatabase db = client.getDatabase(this.db); 
			// select data-set
			MongoCollection<Document> collection = db.getCollection(this.collection);
			// clear collection
			collection.drop();
			
			
			// record id counter
			int recordId = 0;
			// check possible robot tasks
			for (int ri = 1; ri <= this.rows; ri++) 
			{
				for (int rj = 1; rj <= this.columns; rj++) 
				{
					// set robot task 
					String rTask = "pickplace-R" + ri + "C" + rj; 
					
					
					// check possible human tasks
					for (int hi = 1; hi <= this.rows; hi++) 
					{
						for (int hj = 1; hj <= this.columns; hj++) 
						{
							
							// set human task
							String hTask = "pickplace-R" + hi + "C" + hj;
							
							// set default risk 
							double risk = 0;
							// check if tasks coincide
							if (!rTask.equals(hTask)) {
								// get risk index for the considered pair of tasks
								risk = Math.max(1, rand.nextDouble() * this.riskMax);
							}
							
							// insert data
							// create basic object
							Document obj = new Document("_id", recordId);
							// append fields
							obj.append("robot-task", rTask);
							obj.append("human-task", hTask);
							obj.append("risk-dynamic", risk);
							
							// insert document into the collection
							collection.insertOne(obj);
							
							// increment record
							recordId++;
						}
					}
					
				}
			}
		}
		finally 
		{
			// close connection
			client.close();
		}
	}
}
