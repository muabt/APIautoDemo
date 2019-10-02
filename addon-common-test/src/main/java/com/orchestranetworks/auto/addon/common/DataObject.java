package com.orchestranetworks.auto.addon.common;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class DataObject {
	
	private final JsonObject data;
	
	private final List<KeyObject> selectedPKs;
	
	//
	public DataObject() {
		this.data = new JsonObject();
		selectedPKs = new ArrayList<KeyObject>();
		
	}
	
	/**
	 * Add primary key
	 *
	 */
	public void addPK(String key, String value) {
		KeyObject keyObj = new KeyObject();
		keyObj.addPK(key, value);
		selectedPKs.add(keyObj);
	}
	
	/**
	 * Add Key object
	 * 
	 * @param keyObj
	 */
	public void addPK(KeyObject keyObj) {
		selectedPKs.add(keyObj);
	}
	
	/**
	 * Get list of primary key
	 * 
	 * @return
	 */
	public List<KeyObject> getPKs() {
		return this.selectedPKs;
	}
	
	/**
	 * Add the element and key
	 *  
	 * @param key
	 * @param element
	 */
	public void addTable(String key, JsonElement element) {
		this.data.add(key, element);
	}
	
	/**
	 * Gets value by key
	 * 
	 * @param key
	 * @return
	 */
	public JsonElement get(String key) {
		return this.data.get(key);
	}
	
	/**
	 * Check the key whether has or not
	 * 
	 * @param key
	 * 
	 * @return TRUE/FALSE
	 */
	public boolean has(String key) {
		return this.data.has(key);
	}
	
	
	//Code for unit test
	public static void main(String[] args) {
		DataObject dataObject = new DataObject();
		KeyObject keyBuildFrom2Fields = new KeyObject();
		
		keyBuildFrom2Fields.addPK("pk", "pk1").addPK("k2", "pk2");
		dataObject.addPK(keyBuildFrom2Fields);
		
		//
		dataObject.addPK("pk", "pk1");
		

		List<KeyObject> pks = dataObject.getPKs();
		System.out.println("PK size = " + pks.size());
		
		System.out.println("PK 0 = " + pks.get(0).toString());
		System.out.println("PK 1 = " + pks.get(1).toString());
		
		KeyObject keyObject = pks.get(1);
		
		System.out.println("keyObject = " + keyObject.toString());
		
		
		//add table1 to DataObject
		TableObject table = TableObject.newTable("table1");
		JsonObject record = new JsonObject();
		record.addProperty("pk", "pk1");
		record.addProperty("k2", "pk21");
		record.addProperty("col3", "value3");
		record.addProperty("col4", "value4");
		table.addRecord(record);
		
		
		record = new JsonObject();
		record.addProperty("pk", "pk1");
		record.addProperty("k2", "pk2");
		record.addProperty("col3", "value31");
		record.addProperty("col4", "value41");
		table.addRecord(record);
		
		dataObject.addTable(table.getTableName(), table.getTable());
		
		//add table2 to DataObject
		table = TableObject.newTable("table2");
		record = new JsonObject();
		record.addProperty("pk", "pk1");
		record.addProperty("col2", "value2");
		record.addProperty("col3", "value3");
		record.addProperty("col4", "value4");
		table.addRecord(record);
		
		
		record = new JsonObject();
		record.addProperty("pk", "pk2");
		record.addProperty("col2", "value21");
		record.addProperty("col3", "value31");
		record.addProperty("col4", "value41");
		table.addRecord(record);
		
		record = new JsonObject();
		record.addProperty("pk", "pk3");
		record.addProperty("col2", "value21");
		record.addProperty("col3", "value31");
		record.addProperty("col4", "value41");
		table.addRecord(record);
		
		dataObject.addTable(table.getTableName(), table.getTable());
		// use table data
		
		{
			TableObject table1 = TableObject.takeTable(dataObject, "table1");
			
			System.out.println("Result of table name = " + table1.getTableName());
			
			Iterator<JsonElement> it = table1.getRecords().iterator();
			
			while(it.hasNext()) {
				System.out.println("pk= " + it.next().getAsJsonObject().get("pk").getAsString());
			}
			
            //filter by keyObject
			
			System.out.println("Filter KeyObject = k1=pk1;k2=pk2");
			
            JsonArray result2 = table1.filter(keyBuildFrom2Fields);
			
			System.out.println("Filter result size = " + result2.size());
			
			if (result2.size() > 0) {
				System.out.println("Filter result pk = " + result2.get(0).getAsJsonObject().toString());
			}
		}
		
		
		{
			
			TableObject table1 = TableObject.takeTable(dataObject, "table2");
			
			System.out.println("Result of table name = " + table1.getTableName());
			
			Iterator<JsonElement> it = table1.getRecords().iterator();
			
			while(it.hasNext()) {
				System.out.println("pk= " + it.next().getAsJsonObject().get("pk").getAsString());
			}
			
			
			//get record by pk
			
			System.out.println("Filter pk = pk3");
			
			JsonArray result = table1.filter("pk", "pk3");
			
			System.out.println("Filter result size = " + result.size());
			
			if (result.size() > 0) {
				System.out.println("Filter result pk = " + result.get(0).getAsJsonObject().get("pk").getAsString());
			}
			
			
			
			//filter by keyObject
			
			System.out.println("Filter KeyObject = pk=pk1");
			
            JsonArray result1 = table1.filter(keyObject);
			
			System.out.println("Filter result size = " + result1.size());
			
			if (result1.size() > 0) {
				System.out.println("Filter result pk = " + result1.get(0).getAsJsonObject().get("pk").getAsString());
			}
			
		}
		
		{//test equals
			KeyObject testKey1 = new KeyObject();
			testKey1.addPK("pk", "pk1").addPK("k2", "pk2");
			KeyObject testKey2 = new KeyObject();
			testKey2.addPK("pk", "pk1").addPK("k2", "pk2");
			
			System.out.println("testKey1 == testKey2 " + testKey1.equals(testKey2));
			
			KeyObject testKey3 = new KeyObject();
			testKey3.addPK("pk", "pk1").addPK("k2", "pk3");
			System.out.println("testKey1 == testKey3 " + testKey1.equals(testKey3));
			
			KeyObject testKey4 = new KeyObject();
			testKey4.addPK("pk", "pk1");
			System.out.println("testKey1 == testKey4 " + testKey1.equals(testKey4));
			
		}
		
	}
}
