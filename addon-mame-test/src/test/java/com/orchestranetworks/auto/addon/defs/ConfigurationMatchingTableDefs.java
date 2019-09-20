package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.ConfigurationMatchingTableSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.Then;

import java.util.List;
import java.util.Map;

public class ConfigurationMatchingTableDefs {
    ConfigurationMatchingTableSteps onConfigurationMatchingTableSteps;

    @Then("^errors message are raised with the followings$")
    public void errors_message_are_raised_with_the_followings(DataTable dt) throws Throwable {

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String field = row.get("Field");
            String message = row.get("Message");

            onConfigurationMatchingTableSteps.select_field_with_label(field);
            if (!message.isEmpty()) {
                onConfigurationMatchingTableSteps.verify_error_message("Field 'Data model' is mandatory.");
            }
        }
    }
}