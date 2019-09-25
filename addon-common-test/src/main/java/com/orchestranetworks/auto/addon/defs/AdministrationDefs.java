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
    DatasetSteps onDatasetSteps;
    @Steps
    AdministrationSteps onAdministrationSteps;
    @Steps
    CommonSteps onCommonSteps;


    /**
     * Access to the specified parent item administration area
     * <p>
     * <b>Example</b>: <font color="blue">When</font> I access to
     * "<font color="green">Match and Merge configuration</font>" parent item
     * </p>
     *
     * @param path path to the parent item in administration area.
     * @author ctv
     */

    @And("^I access to \"([^\"]*)\" parent item$")
    public void i_access_group_administration(String path) {
        onAdministrationSteps.go_to_group_administration(path);
    }

    /**
     * Access to the specified item administration area
     * <p>
     * <b>Example</b>: <font color="blue">When</font> I access to
     * "<font color="green">Match and Merge configuration</font>" item
     * </p>
     * * @author ctv
     *
     * @param path path to the parent item in administration area.
     */
    @And("^I access to \"([^\"]*)\" item$")
    public void i_access_administration(String path) {
        onAdministrationSteps.go_to_administration_item(path);
    }

    @Given("^I permit to access matching table$")
    public void i_permit_to_access_matching_table() {
        onAdministrationSteps.access_matching_table();
    }
    
    @When("^I access Import service in Actions in left panel$")
    public void i_access_import_service_in_actions_in_left_panel() {
        onAdministrationSteps.access_import_service_in_actions_in_left_panel();
    }
    
    @Then("^I select \"([^\"]*)\" file to import$")
    public void i_select_file_to_import(String fileName) {
        onAdministrationSteps.select_file_to_import(fileName);
    }


}
