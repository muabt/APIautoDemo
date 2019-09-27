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

    @Then("^I should list tabs are \"([^\"]*)\"$")
    public void i_should_list_tabs_are_something(List<String> listTab) {
        onMetadataSteps.verify_list_tabs(listTab);
    }

    @When("^I want to verify data displayed in main tab$")
    public void i_want_to_verify_data_displayed_in_main_tab(List<List<String>> getMetadataRecordView) {
        onMetadataSteps.verify_data_displayed_in_main_tab(getMetadataRecordView);
    }

    @Then("^I should see detailed record as following$")
    public void i_should_see_detailed_record_as_following(List<List<String>> getDataRecordDetail) {
        onMetadataSteps.click_button_preview_record();
        onMetadataSteps.verify_record_details(getDataRecordDetail);
        onMetadataSteps.click_button_close();

    }

    @When("^I want to see group of record$")
    public void i_want_to_see_group_of_record() {
        onMetadataSteps.click_button_preview_group();
    }

    @Then("^I should see manage group of table \"([^\"]*)\"$")
    public void i_should_see_manage_group_of_table(String header) {
        onMetadataSteps.verify_header(header);
    }

    @And("^I should see Duplicates table as following$")
    public void i_should_see_duplicates_table_as_following(List<List<String>> duplicatesTable) {
        onMetadataSteps.verify_duplicate_table(duplicatesTable);

    }

    @And("^I should see the Suspects table as following$")
    public void i_should_see_the_suspects_table_as_following(List<String> getDataSuspectTable) {
        onMetadataSteps.verify_suspect_table(getDataSuspectTable);
    }

    @And("^I should see text \"([^\"]*)\"$")
    public void i_should_see_text(String msg) {
        onMetadataSteps.verify_no_record(msg);
    }
}