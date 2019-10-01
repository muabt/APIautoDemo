package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class AdministrationDefs {
    @Steps
    AdministrationSteps onAdministrationSteps;

    @Given("^I permit to access matching table$")
    public void i_permit_to_access_matching_table() {
        onAdministrationSteps.access_matching_table();
    }

    @When("^I select \"([^\"]*)\" file to import$")
    public void i_select_file_to_import(String fileName) {
        onAdministrationSteps.access_import_service_in_actions_in_left_panel();
        onAdministrationSteps.select_file_to_import(fileName);
    }

}
