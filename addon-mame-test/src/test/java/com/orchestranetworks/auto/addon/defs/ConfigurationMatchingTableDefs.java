package com.orchestranetworks.auto.addon.defs;

import com.google.inject.internal.cglib.core.$Constants;
import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.steps.ConfigurationMatchingTableSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.MetadataSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class ConfigurationMatchingTableDefs {
    @Steps
    ConfigurationMatchingTableSteps onConfigurationMatchingTableSteps;
    @Steps
    DatasetSteps onDatasetSteps;

    @Then("^errors message are raised with the followings$")
    public void errors_message_are_raised_with_the_followings(DataTable dt) throws Throwable {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);

        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String field = row.get("Field");
            String message = row.get("Message");

            if (field.equals("Data model")) {
                onConfigurationMatchingTableSteps.verify_error_message_data_model_field(message);
            }
            if (field.equals("Table")) {
                onConfigurationMatchingTableSteps.verify_error_message_table_field(message);
            }
        }
    }

    @And("^block of error messages are displayed like below$")
    public void block_of_error_messages_are_displayed_like_below(DataTable dt) throws Throwable {
        onConfigurationMatchingTableSteps.click_btn_expand();
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String field = row.get("Block");
            String message = row.get("Message");

            if (field.equals("Data model")) {
                onConfigurationMatchingTableSteps.verify_error_message_data_model_in_block(message);
            }
            if (field.equals("Table")) {
                onConfigurationMatchingTableSteps.verify_error_message_table_in_block(message);
            }
        }
    }

    @And("^I should see Matching record detailed as following$")
    public void i_should_see_matching_record_detailed_as_following(List<List<String>> recordDetail) {
        onConfigurationMatchingTableSteps.click_btn_expand();
        onConfigurationMatchingTableSteps.verify_record_detail(recordDetail);
    }

    @And("^I click to create a record button$")
    public void i_click_to_create_a_record_button() {
        onDatasetSteps.click_btn_create_record();
    }

    @And("^I should see tooltip of all fields as following$")
    public void i_should_see_tooltip_of_all_fields_as_following(DataTable dt) throws Throwable {
        onConfigurationMatchingTableSteps.click_btn_expand();
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String field = row.get("Field");
            String tooltip = row.get("Tooltip");

            if (field.equals("Data model")) {
                onConfigurationMatchingTableSteps.verify_tooltip_of_field(field,tooltip);
            }
            if (field.equals("Table")) {
                onConfigurationMatchingTableSteps.verify_tooltip_of_field(field,tooltip);
            }
            if (field.equals("Active")) {
                onConfigurationMatchingTableSteps.verify_tooltip_of_field(field,tooltip);
            }
            if (field.equals("Default matching process")) {
                onConfigurationMatchingTableSteps.verify_tooltip_of_field(field,tooltip);
            }
            if (field.equals("Source field")) {
                onConfigurationMatchingTableSteps.verify_tooltip_of_field(field,tooltip);
            }
            if (field.equals("Event listener")) {
                onConfigurationMatchingTableSteps.verify_tooltip_of_field(field,tooltip);
            }
            if (field.equals("Disable trigger")) {
                onConfigurationMatchingTableSteps.verify_tooltip_of_field(field,tooltip);
            }
        }
    }
    @And("^I click to preview button$")
    public void i_click_to_preview_button() throws Throwable {
        onConfigurationMatchingTableSteps.click_btn_preview();
    }

    @And("^I should see matching process record details as following$")
    public void i_should_see_matching_process_record_details_as_following(List<List<String>> recordDetail) {
        onConfigurationMatchingTableSteps.verify_matching_process_detail(recordDetail);
    }
}


