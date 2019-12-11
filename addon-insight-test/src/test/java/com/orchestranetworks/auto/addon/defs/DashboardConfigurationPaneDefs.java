package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.DashboardConfigurationPaneSteps;
import com.orchestranetworks.auto.addon.steps.DashboardSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class DashboardConfigurationPaneDefs {
    @Steps
    DashboardConfigurationPaneSteps onDashboardConfigurationPaneSteps;

    @Then("I should see tooltip of all tabs as following$")
    public void i_should_see_tooltip_of_all_tabs_as_following(DataTable dt) throws Throwable {
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String tabs = row.get("Tabs");
            String tooltip = row.get("Tooltip");
            onDashboardConfigurationPaneSteps.verify_tooltip_of_tabs(tabs, tooltip);
        }
    }
}
