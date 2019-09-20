package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
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


    @And("^I delete the dataspace$")
    public void i_delete_the_dataspace() {
        String dataspace = SessionData.getValueFromSession(Constants.DATASPACE_IDENTIFIER);
        onCommonSteps.access_menu(Constants.MENU_ADMINISTRATION);
        onCommonSteps.go_to_administration_item("Repository management>Dataspaces");
        onCommonSteps.go_to_administration_item("Dataspaces/snapshots");
        onAdministrationSteps.filter_item(dataspace);
        onAdministrationSteps.close_dataspace(dataspace);
        onAdministrationSteps.delete_dataspace(dataspace);
    }

    @Given("^I permit to access matching table$")
    public void i_permit_to_access_matching_table() {
        onAdministrationSteps.access_matching_table();
    }


}
