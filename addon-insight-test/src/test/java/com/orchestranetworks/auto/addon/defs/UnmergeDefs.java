package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.UnmergeSteps;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;


public class UnmergeDefs {

    @Steps
    UnmergeSteps onUnmergeSteps;


    @Then("^the popup message will be shown \"([^\"]*)\"$")
    public void the_popup_message_will_be_shown(String message) {
        onUnmergeSteps.verify_message_unmerge_service_popup(message);
    }

}
