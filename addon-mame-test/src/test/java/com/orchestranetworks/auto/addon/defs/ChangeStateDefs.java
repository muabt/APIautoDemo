package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.ChangeStateSteps;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;

public class ChangeStateDefs {
    @Steps ChangeStateSteps onChangeStateSteps;

    @Then("^Change state screen will be displayed$")
    public void change_state_screen_will_be_displayed (String desState) {
        onChangeStateSteps.verify_state_descriptions(desState);
    }

    @When("^I select target state$")
    public void i_select_target_state(String targetState)  {


    }

    @And("^I complete change state process$")
    public void i_complete_change_state_process()  {
        onChangeStateSteps.click_button_launch_service();
    }


}

