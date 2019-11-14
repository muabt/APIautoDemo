package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.UnmergeSteps;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

import java.util.List;


public class UnmergeDefs {

    @Steps
    UnmergeSteps onUnmergeSteps;


    @Then("^the popup message will be shown \"([^\"]*)\"$")
    public void the_popup_message_will_be_shown(String message) {
        onUnmergeSteps.verify_message_unmerge_service_popup(message);
    }

    @And("^I verify business table before changing as below$")
    public void i_verify_business_table_before_changing_as_below(List<List<String>> dt) {
        onUnmergeSteps.verify_business_table(dt);
    }


    @Then("^I verify business table after changing as below$")
    public void i_verify_business_table_after_changing_as_below(List<List<String>> dt) {
        onUnmergeSteps.verify_business_table(dt);
    }

}