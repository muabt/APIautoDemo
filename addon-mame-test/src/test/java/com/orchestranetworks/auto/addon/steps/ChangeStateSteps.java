package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.ChangeStatePage;
import org.junit.Assert;

public class ChangeStateSteps {

    ChangeStatePage onChangeStatePage;

    public void verify_state_descriptions (String stateDes){
        Assert.assertEquals(stateDes, onChangeStatePage.getChangeStateWidget().getStateDes());
    }

    public void click_button_launch_service() {
        onChangeStatePage.getChangeStateWidget().clickBtnLaunchService();
    }

    public void select_target_state() {

    }

}
