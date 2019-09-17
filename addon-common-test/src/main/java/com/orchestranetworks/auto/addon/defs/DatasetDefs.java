package com.orchestranetworks.auto.addon.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.steps.DatasetSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class DatasetDefs {

    @Steps
    DatasetSteps onDatasetSteps;

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
     * @throws Throwable
     */
    @When("^I select first \"([^\"]*)\" records in table$")
    public void I_select_first_num_of_records_in_table(String numOfRecord) {
        onDatasetSteps.select_first_record(numOfRecord);
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
     * @throws Throwable
     */
    @And("^I select table service \"([^\"]*)\"$")
    public void I_select_table_service(String service) throws Throwable {
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
     * @throws Throwable
     */
    @And("^I create record with the followings$")
    public void i_create_record_with_the_followings(DataTable dt) throws Throwable {
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
                String dataType = tmp[1];
                String cell = row.get(i);

                if (!cell.isEmpty()) {
                    onDatasetSteps.input_record_field(col, cell, dataType);
                }
            }
        }
        onDatasetSteps.click_btn_save_and_close();
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
     * @throws Throwable
     */
    @When("^I select some records with primary key as following$")
    public void i_select_records_as_following(List<List<String>> dt) throws Throwable {
        for (int i = 1; i < dt.size(); i++) {
            String[] col = dt.get(i).toArray(new String[0]);
            onDatasetSteps.select_record_with_PK(col);
        }

    }

	
	@And("^I access to \"([^\"]*)\" tab$")
	public void i_access_to_tab(String label) throws Throwable {
		onDatasetSteps.click_on_tab_label(label);
	}
	
	/**
     * I want to delete all records in the current table
     *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> I want to delete all of record in the current table</font>>"
	 * </p>
     * @throws Throwable
     */
	@And("^I want to delete all of record in the current table$")
	public void detete_all_record_in_table() throws Throwable {
		onDatasetSteps.delete_all_data_in_table();
	}

}
