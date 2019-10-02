package com.orchestranetworks.auto.addon.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.steps.MetadataSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class MetadataDefs {
    @Steps
    MetadataSteps onMetadataSteps;

    /**
     * Verify the list tab
     * //TODO: add sample
     * @param listTab
     */
    @Then("^I should list tabs are \"([^\"]*)\"$")
    public void i_should_list_tabs_are_something(List<String> listTab) {
        onMetadataSteps.verify_list_tabs(listTab);
    }

    /**
     * Verify data display in the main tab
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font> I want to verify data displayed in main tab
     * <ul>
     * <font color="green">| Record    | State  | Group     |</font>
     * </ul>
     * <ul>
     * <font color="green">| Fast food | Golden | Fast food |</font>
     * </ul>

     * </ul>
     * </p>
     *
     * @param getMetadataRecordView record view metadata table information
     */
    @When("^I want to verify data displayed in main tab$")
    public void i_want_to_verify_data_displayed_in_main_tab(List<List<String>> getMetadataRecordView) {
        onMetadataSteps.verify_data_displayed_in_main_tab(getMetadataRecordView);
    }

    /**
     * Verify the record view metadata table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I should see detailed record as following
     * <ul>
     * <font color="green">| Identifier | Parent    | Name      | Comment             |</font>
     * </ul>
     * <ul>
     * <font color="green">|          1 | Fast food | Fast food | There is no commemt |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param getDataRecordDetail record view metadata table information
     */
    @Then("^I should see detailed record as following$")
    public void i_should_see_detailed_record_as_following(List<List<String>> getDataRecordDetail) {
        onMetadataSteps.click_button_preview_record();
        onMetadataSteps.verify_record_details(getDataRecordDetail);
        onMetadataSteps.click_button_close();

    }

    /**
     * //TODO: add description
     *
     */
    @When("^I want to see group of record$")
    public void i_want_to_see_group_of_record() {
        onMetadataSteps.click_button_preview_group();
    }

    /**
     * //TODO: add description
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I should see manage group of table "<font color="green>Fast food</font>"
     * </ul>
     * </p>
     *
     * @param header     table name that user want to access
     */
    @Then("^I should see manage group of table \"([^\"]*)\"$")
    public void i_should_see_manage_group_of_table(String header) {
        onMetadataSteps.verify_header(header);
    }

    /**
     * Verify the Duplicates table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I should see Duplicates table as following
     * <ul>
     * <font color="green">| State  | Identifier | Parent    | Name        | Comment               |</font>
     * </ul>
     * <ul>
     * <font color="green">| Golden | 1          | Fast food | Fast food   | There is no commemt   |</font>
     * </ul>
     * <ul>
     * <font color="green">| Merged | 2          | Fast food | Fast food 1 | There is no commemt 1 |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param duplicatesTable Duplicates table information
     */
    @And("^I should see Duplicates table as following$")
    public void i_should_see_duplicates_table_as_following(List<List<String>> duplicatesTable) {
        onMetadataSteps.verify_duplicate_table(duplicatesTable);

    }

    /**
     * Verify the Duplicates table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I should see the Suspects table as following
     * <ul>
     * <font color="green">| State | Identifier | Parent | Name | Comment |</font>
     * </ul>
     * </ul>
     * </p>
     *
     * @param getDataSuspectTable DataSuspectTable information
     */
    @And("^I should see the Suspects table as following$")
    public void i_should_see_the_suspects_table_as_following(List<String> getDataSuspectTable) {
        onMetadataSteps.verify_suspect_table(getDataSuspectTable);
    }

    /**
     * Access to a table of a dataset
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I should see text "<font color="green">No records found</font>"
     * </ul>
     * </p>
     *
     * @param msg message to verify
     */
    @And("^I should see text \"([^\"]*)\"$")
    public void i_should_see_text(String msg) {
        onMetadataSteps.verify_no_record(msg);
    }

	@And("^Text \"([^\"]*)\" will be displayed under Record info$")
	public void text_something_will_be_displayed_under_record_info(String label)  {
    	onMetadataSteps.verify_record_having_auto_ctrated_is_yes(label);

	}

    @When("^I double click a record$")
    public void i_double_click_a_record() {
    onMetadataSteps.double_click_on_a_record();
    }


}