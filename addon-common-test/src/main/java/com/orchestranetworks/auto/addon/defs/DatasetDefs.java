package com.orchestranetworks.auto.addon.defs;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.DataObject;
import com.orchestranetworks.auto.addon.common.KeyObject;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.utils.SessionData;
import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;

import java.util.*;

public class DatasetDefs {

    @Steps
    DatasetSteps onDatasetSteps;
    @Steps
    CommonSteps onCommonSteps;

    /**
     * Select number of first records in the table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font>I select first "<font color="green">4</font>" records in table
     * </ul>
     * </p>
     *
     * @param numOfRecord number of first records that want to select
     */
    @When("^I select first \"([^\"]*)\" records in table$")
    public void I_select_first_num_of_records_in_table(String numOfRecord) {
        onDatasetSteps.select_first_record(numOfRecord);

    }

    /**
     * Select last record in the table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font>I select last record in table
     * </ul>
     * </p>
     */
    @When("^I select last record in table$")
    public void I_select_last_record_in_table() {
        onDatasetSteps.select_last_record();
    }

    /**
     * Select the table service
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I select table service "<font color="green">View history</font>"
     * </ul>
     * </p>
     *
     * @param service table service that user want to execute
     */
    @And("^I select table service \"([^\"]*)\"$")
    @When("^I select record service \"([^\"]*)\"$")
    public void I_select_table_service(String service) {
        onDatasetSteps.select_table_service(service);
    }

    /**
     * Create record with given information
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I create record with the followings
     *      <ul>
     * 			     <font color="green">| Identifer:TXT | Civil status:DDL | First name:TXT | Last name:TXT | Maiden name:TXT | Birth date:DATE | Gender:RADIO | Marital status:DDL | GDPR type:DDL |</font>
     *     </ul>
     *     <ul>
     * 			     <font color="green">|               | Dr.              | Jenifer        | Pham          |                 | 7/29/1988       | Female       | (C) Single         | Child         |</font>
     *     </ul>
     * </ul>
     * </p>
     *
     * @param dt information of the record
     */
    @And("^I create record with the followings$")
    public void i_create_record_with_the_followings(DataTable dt) {
        create_record_with_content(dt);
    }


    /**
     * Select a record from the table given the primary key
     * <p>
     * <b>Example</b>:
     * <font color="blue">When</font> I select some records with primary key as following
     *     <ul>
     * 			     <font color="green">| ID |</font>
     *     </ul>
     *     <ul>
     * 			     <font color="green">| 1 |</font>
     *     </ul>
     * </ul>
     * </p>
     *
     * @param dt primary key of the record that user want to select
     */
    @When("^I select some records with primary key as following$")
    public void i_select_records_as_following(List<List<String>> dt) {
        List<String> headers = dt.get(0);
        DataObject dataObject = new DataObject();
        KeyObject keyObject = null;
        for (int i = 1; i < dt.size(); i++) {
            List<String> row = dt.get(i);
            keyObject = new KeyObject();
            for (int j = 0; j < headers.size(); j++) {
                keyObject.addPK(headers.get(j), row.get(j));
            }
            dataObject.addPK(keyObject);
            onDatasetSteps.select_record_with_PK(row);
        }
        SessionData.saveDataObjectToSession(Constants.DATA_OBJECT, dataObject);
    }

    @When("^I select some records are filtered with primary key as following$")
    public void i_select_some_records_are_filtered_with_primary_key_as_following(List<List<String>> dt) {
        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        List<String> headers = dt.get(0);
        Map<String, String> condition = null;
        for (int j = 1; j < dt.size(); j++) {
            List<String> record = dt.get(j);
            for (int i = 0; i < headers.size(); i++) {
                condition = new HashMap<String, String>();
                condition.put(Constants.CRITERION, headers.get(i));
                condition.put(Constants.OPERATION, "equals");
                condition.put(Constants.VALUE, record.get(i));
                condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
                filterConditions.add(condition);
            }
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);
        DataObject dataObject = new DataObject();
        KeyObject keyObject = null;
        for (int i = 1; i < dt.size(); i++) {
            List<String> row = dt.get(i);
            keyObject = new KeyObject();
            for (int j = 0; j < headers.size(); j++) {
                keyObject.addPK(headers.get(j), row.get(j));
            }
            dataObject.addPK(keyObject);
            onDatasetSteps.select_checkbox_with_text(row.toString());
        }
        SessionData.saveDataObjectToSession(Constants.DATA_OBJECT, dataObject);
    }

    @And("^I access to \"([^\"]*)\" tab$")
    public void i_access_to_tab(String label) {
        onDatasetSteps.click_on_tab_label(label);
    }

    /**
     * I want to delete all records in the current table
     *
     * <p>
     * <b>Example</b>:
     * <font color="blue">And</font> I want to delete all of record in the current table</font>>"
     * </p>
     */
    @And("^I want to delete all of record in the current table$")
    public void detete_all_record_in_table() {
        onDatasetSteps.delete_all_data_in_table();
    }

    /**
     * Select the "Delete" data service
     * <p>
     * <b>Example</b>:
     * <font color="blue">And</font> I want to delete all of record in the current table</font>>"
     * </p>
     */
    @Then("^delete it$")
    public void delete_it() {
        onDatasetSteps.select_table_service("Delete");
        onDatasetSteps.confirmPopupOK();
    }

    /**
     * Select the record that contains the text
     *
     * @param text text included in the record
     */
    @And("^I select the record that contains \"([^\"]*)\"$")
    public void select_record_with_text(String text) {
        onDatasetSteps.select_record_with_text(text);
    }

    private void create_record_with_content(DataTable dt) {
        onDatasetSteps.click_btn_create_record();
        List<List<String>> dataTable = dt.asLists(String.class);
        List<String> header = dataTable.get(0);
        // Get header then split to 2 element of array
        for (int i = 0; i < header.size(); i++) {
            String[] tmp = header.get(i).split(":");
            // Get row of data table
            for (int j = 1; j < dataTable.size(); j++) {
                List<String> row = dataTable.get(j);
                String col = tmp[0];
                String dataType = tmp[1].trim();
                String cell = row.get(i).trim();
                if (!cell.isEmpty()) {
                    onDatasetSteps.input_record_field(col, cell, dataType);
                }
            }
        }
        onDatasetSteps.click_btn_save_and_close();
    }

    @Then("^Then no records found in table \"([^\"]*)\" with filter$")
    public void thenNoRecordsFoundInTableWithFilter(String tableName, List<List<String>> dt) throws Throwable {
        JsonArray expectedTbl = SessionData.convertArrayListToJson(dt);
        onCommonSteps.click_on_table_name(tableName);

        List<Map<String, String>> filterConditions = new ArrayList<Map<String, String>>();
        Map<String, String> condition = null;
        for (int i = 0; i < expectedTbl.size(); i++) {
            condition = new HashMap<String, String>();
            JsonObject record = expectedTbl.get(i).getAsJsonObject();
            String header = dt.get(0).get(i);
            condition.put(Constants.CRITERION, header);
            condition.put(Constants.OPERATION, "equals");
            condition.put(Constants.VALUE, record.get(header).getAsString().replace("*", "|"));
            condition.put(Constants.FIELD_TYPE, Constants.INPUT_TYPE);
            filterConditions.add(condition);
        }
        onCommonSteps.search_with_advance_search(Constants.AT_LEAST_ONE_MATCHES, filterConditions);

        onCommonSteps.verify_table_no_record_found();
    }
}
