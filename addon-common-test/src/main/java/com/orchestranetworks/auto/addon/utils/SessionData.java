package com.orchestranetworks.auto.addon.utils;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.DataObject;
import org.assertj.core.api.SoftAssertions;

import net.serenitybdd.core.Serenity;

import static org.assertj.core.api.Assertions.assertThat;

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
     * @param dataTable
     * @return
     * @author hue
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

    public static void saveDataObjectToSession(String key, DataObject value) {
        Serenity.setSessionVariable(key).to(value);
        LogWork.info("Save Data object to session with key " + key);
    }

    public static DataObject getDataObjectFromSession(String key) {
        DataObject dataOject = Serenity.sessionVariableCalled(key);
        if (dataOject == null) {
            throw new RuntimeException("No Data object in session with this key:" + key);
        }
        return dataOject;
    }

    private static SoftAssertions softAssertions;


    public static SoftAssertions softAssert() {
        if (softAssertions == null) {
            softAssertions = new SoftAssertions();
        }
        return softAssertions;
    }

    public static String getJsonTableValue(JsonObject row, String colName) {
        return row.get(colName).toString().replaceAll("\"", "");
    }

    public static String getJsonTableValueWithSourceValue(String tblKey, String sourceKey, String sourceValue, String targetKey) {
        JsonArray tbl = Serenity.sessionVariableCalled(tblKey);
        String targetValue = "";
        for (int i = 0; i < tbl.size(); i++) {
            JsonObject row = tbl.get(i).getAsJsonObject();
            String cell = row.get(sourceKey).toString().replaceAll("\"", "");
            if (cell.equals(sourceValue)) {
                targetValue = row.get(targetKey).toString().replaceAll("\"", "");
                break;
            }
        }
        return targetValue;
    }

    public static JsonArray convertArrayListToJson(List<List<String>> tbl) {
        List<String> listHeader = tbl.get(0);
        JsonArray arr = new JsonArray();
        for (int i = 1; i < tbl.size(); i++) {
            List<String> row = tbl.get(i);
            JsonObject e = new JsonObject();
            for (int j = 0; j < row.size(); j++) {
                e.addProperty(listHeader.get(j), row.get(j));
            }
            arr.add(e);
        }
        return arr;
    }

    public static void compareJsonObjectValue(JsonObject actual, String actualHeader, JsonObject expected, String expectedHeader) {
        String actualValue = actual.get(actualHeader).getAsString();
        String expectedValue = expected.get(expectedHeader).getAsString();
        assertThat(actualValue).isEqualTo(expectedValue);
    }

    public static void compareJsonObjectValue(JsonObject actual, String actualHeader, String expectedValue) {
        LogWork.error("Json Object  is null [" + actual.getAsJsonObject()  + "]");
        if (actual == null)
            LogWork.error("Json Object  is null [" + actual.getAsJsonObject()  + "]");
        String actualValue = actual.get(actualHeader).getAsString();
        if (!expectedValue.isEmpty() && !actualValue.isEmpty()) {
            assertThat(actualValue).isEqualTo(expectedValue);
        }
    }

    public static void compareJsonObjectValueContains(JsonObject actual, String actualHeader, String expectedValue) {
        String actualValue = actual.get(actualHeader).getAsString();
        assertThat(actualValue).contains(expectedValue);
    }

}
