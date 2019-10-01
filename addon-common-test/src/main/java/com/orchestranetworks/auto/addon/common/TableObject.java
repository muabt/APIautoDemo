package com.orchestranetworks.auto.addon.common;

import java.util.Iterator;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class TableObject {

	private final static String TABLE_NAME_KEY = "table_name_key";
	private final static String RECORD_KEY = "record_key";

	private final JsonObject table;
	
	private TableObject(String tableName) {
		table = new JsonObject();
		addTableName(tableName);
	}

	private TableObject(JsonObject table) {
		this.table = table;
	}

	public static JsonElement newRecord() {
		return new JsonObject();
	}

	public static TableObject newTable(String tableName) {
		return new TableObject(tableName);
	}

	public static TableObject newTable(JsonObject table) {
		return new TableObject(table);
	}
	
	/**
	 * Get table name from DataObject
	 * 
	 * @param data
	 * @param tableName
	 * @return
	 */
	public static TableObject takeTable(DataObject data, String tableName) {
		if (data != null) {
			JsonObject gotTable = data.get(tableName).getAsJsonObject();
			return new TableObject(gotTable);
		}
		return new TableObject(tableName);
	}


	public void addRecord(JsonElement record) {
		JsonArray records;
		if (table.has(RECORD_KEY)) {
			records = table.get(RECORD_KEY).getAsJsonArray();
		} else {
			records = new JsonArray();
			table.add(RECORD_KEY, records);
		}
		records.add(record);
	}
	
	public JsonArray getRecords() {
		return this.table.get(RECORD_KEY).getAsJsonArray();
		
	}

	public int size() {
		if (table.has(RECORD_KEY)) {
			return table.get(RECORD_KEY).getAsJsonArray().size();
		}
		return 0;
	}

	public String getTableName() {
		return table.get(TABLE_NAME_KEY).getAsString();
	}
	
	private void addTableName(String tableName) {
		table.addProperty(TABLE_NAME_KEY, tableName);
	}

	public JsonObject getTable() {
		return table;
	}
	
	/**
	 * This is simple filter by key and value
	 * 
	 * @param fieldName
	 * @param value
	 * @return
	 */
	public JsonArray filter(String fieldName, String value) {
		JsonArray result = new JsonArray();

		JsonArray array = this.getRecords();

		Iterator<JsonElement> it = array.iterator();
		JsonObject record;
		String gotValue;

		while (it.hasNext()) {
			record = it.next().getAsJsonObject();
			gotValue = record.get(fieldName).getAsString();
			if (value.equalsIgnoreCase(gotValue)) {
				result.add(record);
			}
		}

		return result;
	}
	
	
	public JsonArray filter(KeyObject key) {
		JsonArray result = new JsonArray();
		JsonArray array = this.getRecords();

		Iterator<JsonElement> it = array.iterator();
		JsonObject record;
		
		while (it.hasNext()) {
			record = it.next().getAsJsonObject();
			if (compare(key, record)) {
				result.add(record);
			}
		}

		return result;
	}

	private boolean compare(KeyObject key, JsonObject record) {
		JsonObject recordKey;
		String gotValue;
		boolean isEqual = true;
		String value;
		Iterator<JsonElement> keyIt = key.getPK().iterator();
		while(keyIt.hasNext()) {
			recordKey = keyIt.next().getAsJsonObject();
			for(Map.Entry<String, JsonElement> entry : recordKey.entrySet()) {
				gotValue = record.get(entry.getKey()).getAsString();
				value = entry.getValue().getAsString();
				isEqual &= value.equalsIgnoreCase(gotValue);
			}
		}
		return isEqual;
	}

	@Override
	public String toString() {
		return getTableName();
	}
}
