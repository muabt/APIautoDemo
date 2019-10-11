package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.ChangeStateSteps;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class ChangeStateDefs {
    @Steps
    ChangeStateSteps onChangeStateSteps;


    @Then("^change state screen will be displayed with the title \"([^\"]*)\"$")
    public void change_state_screen_will_be_displayed_with_the_title(String stateDes) {
        onChangeStateSteps.verify_state_descriptions(stateDes);
    }

    @And("^I complete change state process$")
    public void i_complete_change_state_process() {
        onChangeStateSteps.click_button_launch_service();
    }

    @When("^I select target state is Golden$")
    public void iSelectTargetStateIsGolden()
    {
        onChangeStateSteps.select_golden_state();
    }

    @When("^I select target state is Unset$")
    public void iSelectTargetStateIsUnset() {
        onChangeStateSteps.select_target_state();
    }
}

