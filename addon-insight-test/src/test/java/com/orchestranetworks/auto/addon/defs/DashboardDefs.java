package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.DashboardSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class DashboardDefs {
    @Steps
    DashboardSteps onDashboardSteps;

    @Then("^errors message are raised with the followings$")
    public void errors_message_are_raised_with_the_followings(DataTable dt) throws Throwable {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String field = row.get("Field");
            String message = row.get("Message");

            if (field.equals("Dashboard name")) {
                onDashboardSteps.verify_error_message_dashboard_name_field(message);
            }
        }
    }

    @And("^block of error messages are displayed like below$")
    public void block_of_error_messages_are_displayed_like_below(DataTable dt) throws Throwable {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (int i = 0; i < list.size(); i++) {
            Map<String, String> row = list.get(i);
            String field = row.get("Block");
            String message = row.get("Message");

            if (field.equals("Dashboard name")) {
                onDashboardSteps.verify_error_message_dashboard_name_in_block(message);
            }
        }
    }

    @And("^I should see the dashboard configuration pane$")
    public void i_should_see_the_dashboard_configuration_pane() throws Throwable {
        onDashboardSteps.verify_the_display_configuration_pane();
    }


    @And("^I create dashboard with the followings$")
    public void i_create_dashboard_with_the_followings(DataTable dt) {
        List<List<String>> dataTable = dt.asLists(String.class);
        List<String> header = dataTable.get(0);
        // Get header then split to 2 element of array
        //onDashboardSteps.click_btn_expand_french_locale();
        for (int i = 0; i < header.size(); i++) {
            String[] tmp = header.get(i).split(":");
            // Get row of data table
            for (int j = 1; j < dataTable.size(); j++) {
                List<String> row = dataTable.get(j);
                String col = tmp[0];
                String dataType = tmp[1].trim();
                String cell = row.get(i).trim();
                if (!cell.isEmpty()) {
                    onDashboardSteps.input_dashboard_record_field(col, cell, dataType);
                }
            }
        }
        onDashboardSteps.click_btn_save_and_close();
    }


}
