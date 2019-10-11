package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.ChangeStatePage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import static org.assertj.core.api.Assertions.assertThat;

public class ChangeStateSteps extends ScenarioSteps {
    ChangeStatePage statePage;

    @Step
    public void verify_state_descriptions (String stateDes){
//        System.out.println(stateDes);
//        waitABit(5000);
//        System.out.println("statePage getChangeStateWidget == null " + (statePage.getChangeStateWidget() == null));
//         statePage.getChangeStateWidget().getStateDes();
//        System.out.println("+++++"+ statePage.getChangeStateWidget().getStateDes());
        assertThat(statePage.getChangeStateWidget().getStateDes()).isEqualTo(stateDes);
    }

    public void select_target_state() {
    statePage.getChangeStateWidget().selectTargetState();

    }

    public void click_button_launch_service()
    {
        statePage.getChangeStateWidget().clickBtnLaunchService();
    }


    public void select_golden_state() {
        statePage.getChangeStateWidget().selectGodelState();
    }
}
