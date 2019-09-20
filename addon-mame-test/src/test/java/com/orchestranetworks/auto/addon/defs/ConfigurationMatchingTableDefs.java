package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.ConfigurationMatchingTableSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class ConfigurationMatchingTableDefs {
    @Steps
    ConfigurationMatchingTableSteps onConfigurationMatchingTableSteps;

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


}


