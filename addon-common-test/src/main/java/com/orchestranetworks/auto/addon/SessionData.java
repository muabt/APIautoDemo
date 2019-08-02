package com.orchestranetworks.auto.addon;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.assertj.core.api.SoftAssertions;

import net.serenitybdd.core.Serenity;

public class SessionData {
	private static final String TABLE_DATA_LIST = "#TableData#";
	private static final String SOFT_ASSERTION_LIST = "#SoftAssertions#";
	private static HashMap<String, String> SessionData = null;

	public static void addDataTable(String keyDataTableName, List<List<String>> dataTable, boolean isReLoad) {
		// Get session data
		HashMap<String, LinkedHashMap<Integer, List<String>>> sessionDataTable = new HashMap<>();
		sessionDataTable = Serenity.sessionVariableCalled(TABLE_DATA_LIST);
		// If session data not exist then initialize
		if (sessionDataTable == null) {
			HashMap<String, LinkedHashMap<Integer, List<String>>> hDataTable = new HashMap<>();
			Serenity.setSessionVariable(TABLE_DATA_LIST).to(hDataTable);
			sessionDataTable = Serenity.sessionVariableCalled(TABLE_DATA_LIST);
		}
		// Check Data Table exist or not in Session Data
		boolean bExist = true;
		if (sessionDataTable.get(keyDataTableName) == null) {
			bExist = false;
		}

		if (((bExist) && (!isReLoad)) || (!bExist)) {
			// Add data for session data
			LinkedHashMap<Integer, List<String>> mAddDataTable = new LinkedHashMap<>();
			LogWork.info("Loading data from Data Table into [" + keyDataTableName + "]");
			mAddDataTable = loadDataTable(dataTable);
			sessionDataTable.put(keyDataTableName, mAddDataTable);
			Serenity.setSessionVariable(TABLE_DATA_LIST).to(sessionDataTable);
		}
	}

	/**
	 * Load all data table from Feature file (included Colunm Name )
	 * 
	 * @author hue
	 * @param dataTable
	 * @return
	 */
	public static LinkedHashMap<Integer, List<String>> loadDataTable(List<List<String>> dataTable) {
		// Used the LinkedHashMap to maintain the order
		LinkedHashMap<Integer, List<String>> hashMap = new LinkedHashMap<Integer, List<String>>();
		// Add
		for (int i = 0; i < dataTable.size(); i++) {
			hashMap.put(i, dataTable.get(i));
		}
		return hashMap;
	}

	public static LinkedHashMap<Integer, List<String>> getDataTbRowsByValEqualInCol(String dataTableKey, String colName,
			String givenVal) {
		LinkedHashMap<Integer, List<String>> tempSessionDataTable = getDataTbRows(dataTableKey);
		LinkedHashMap<Integer, List<String>> output = new LinkedHashMap<>();
		int colIndex = tempSessionDataTable.get(0).indexOf(colName);
		if (colIndex == -1) {
			LogWork.error("Column [" + colName + "] not found in Data Table [" + dataTableKey + "].");
			throw new IllegalArgumentException(
					"Column [" + colName + "] not found in Data Table [" + dataTableKey + "]. Re check data !");
		} else {
			// Loop through data in data table and add match data row
			for (int key : tempSessionDataTable.keySet()) {
				List<String> lTemp = tempSessionDataTable.get(key);
				if (!(lTemp.size() == 0)) {
					if (lTemp.get(colIndex).equals(givenVal)) {
						output.put(key, lTemp);
					}
				} else {
					LogWork.error("Data Row not found in Data Table [" + dataTableKey + "].[" + key + "].");
					throw new IllegalArgumentException(
							"Data Row not found in Data Table [" + dataTableKey + "].[" + key + "]. Re check data !");
				}
			}
		}
		return output;
	}

	/**
	 * Get data table rows (data table description in feature file) from Session
	 * Data variable by added Data Table Key.
	 */
	public static LinkedHashMap<Integer, List<String>> getDataTbRows(String dataTableKey) {
		HashMap<String, LinkedHashMap<Integer, List<String>>> hSessionDataTable = new HashMap<>();
		hSessionDataTable = Serenity.sessionVariableCalled(TABLE_DATA_LIST);
		return hSessionDataTable.get(dataTableKey);
	}

	/**
	 * Get cell data value (data table description in feature file) from Session
	 * Data variable by index of Row and Column Name.
	 *
	 */
	public static String getDataTbVal(String dataTableKey, int rowIndex, String colName) {
		String value = "";
		LinkedHashMap<Integer, List<String>> tempSessionDataTable = getDataTbRows(dataTableKey);
		int colIndex = tempSessionDataTable.get(0).indexOf(colName);
		if (colIndex == -1) {
			LogWork.warn("Column [" + colName + "] not found in Data Table [" + dataTableKey + "].");
			return value;
		} else {
			try {
				value = tempSessionDataTable.get(rowIndex).get(colIndex);
			} catch (Exception e) {
				value = "";
				LogWork.warn("Row [" + rowIndex + "] not found in Data Table [" + dataTableKey + "].");
			}

		}
		return value;
	}

	public static String getDataTbVal(String dataTableKey, int rowIndex, int colIndex) {
		String value = "";
		LinkedHashMap<Integer, List<String>> tempSessionDataTable = getDataTbRows(dataTableKey);
		try {
			value = tempSessionDataTable.get(rowIndex).get(colIndex);
		} catch (Exception e) {
			value = "";
			LogWork.warn("Row [" + rowIndex + "] or Colunm [" + colIndex + "] not found in Data Table [" + dataTableKey
					+ "].");
		}

		return value;
	}

	public static String getDataTbColName(String dataTableKey, int colIndex) {
		String colName = null;
		try {
			colName = getDataTbRows(dataTableKey).get(0).get(colIndex);
		} catch (Exception e) {
			LogWork.error(" Column Index [" + colIndex + "] not found in Data Table [" + dataTableKey + "].");
			throw new IllegalArgumentException(
					"Column Index [" + colIndex + "] not found in Data Table [" + dataTableKey + "]. Re check data !");
		}
		return colName;
	}

	/**
	 * Get data table row (data table description in feature file) from Session
	 * Data variable by Row Index. * @author hue
	 * 
	 * @param dataTableKey
	 * @param row
	 * @return List<String>
	 */
	public static List<String> getDataTbRowByRowIndex(String dataTableKey, int row) {
		return getDataTbRows(dataTableKey).get(row);
	}

	public static void saveValueToSession(String key, String value) {
		if (SessionData == null) {
			SessionData = new HashMap();
		}
		SessionData.put(key, value);
	}

	public static String getValueFromSession(String key) {
		if (SessionData == null) {
			SessionData = new HashMap();
		}
		String value = SessionData.get(key);
		if (value == null) {
			value = key;
			LogWork.debug("GET_DATA_FROM_SESSION_LIST_IS_NULL:[" + key + "]=[" + value + "]");
		} else
			LogWork.debug("GET_DATA_FROM_SESSION_LIST:[" + key + "]=[" + value + "]");
		return value;
	}

	private static SoftAssertions softAssertions;

	public static boolean compareTableNotFixHeader(String expectedTb, String actualTb) {
		softAssertions = new SoftAssertions();
		boolean diff = true;

		LinkedHashMap<Integer, List<String>> expectedData = new LinkedHashMap<>();
		LinkedHashMap<Integer, List<String>> actualData = new LinkedHashMap<>();

		expectedData = getDataTbRows(expectedTb);
		actualData = getDataTbRows(actualTb);

		List<String> expectedHeader = expectedData.get(0);
		List<String> actualHeader = actualData.get(0);

		assertThat(actualData.keySet()).isEqualTo(expectedData.keySet());
		assertThat(expectedHeader).isEqualTo(actualHeader);

		if (!expectedData.keySet().equals(actualData.keySet())) {
			LogWork.error("Number of rows is not equal, expected:" + expectedData.keySet() + ", but was:"
					+ actualData.keySet());
		}
		if (!expectedHeader.equals(actualHeader)) {
			LogWork.error("Number of colunm is not equal, expected:" + expectedData.keySet() + ", but was:"
					+ actualData.keySet());
		}
		for (int row : expectedData.keySet()) {
			for (int col = 0; col < expectedHeader.size(); col++) {
				String expectedCell = getDataTbVal(actualTb, row, col);
				String actualCell = getDataTbVal(actualTb, row, col);
				if (expectedCell.contains("- $")) {
					expectedCell.replaceAll("- $", "").trim();
				}
				softAssertions.assertThat(expectedCell).isEqualTo(expectedCell);
				if (!expectedCell.equals(actualCell)) {
					diff = false;
				}
			}
		}
		softAssertions.assertAll();
		return diff;
	}

	public static SoftAssertions softAssert() {
		if (softAssertions == null) {
			softAssertions = new SoftAssertions();
		}
		return softAssertions;
	}

}
