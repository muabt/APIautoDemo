package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import net.thucydides.core.annotations.Steps;


public class AdministrationDefs {
    @Steps
    AdministrationSteps onAdministrationSteps;

    @Given("^I want to create matching table$")
    public void i_want_to_create_matching_table() {
        onAdministrationSteps.access_matching_table();
    }
}
