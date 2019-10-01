package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.ChangeStatePage;
import org.junit.Assert;

public class ChangeStateSteps {

    ChangeStatePage onChangeStatepage;

    public void verify_state_descriptions (String stateDes){
        Assert.assertEquals(stateDes,onChangeStatepage.getChangeStateWidget().getStateDes());
    }

    public void click_button_launch_service() {
        onChangeStatepage.getChangeStateWidget().clickBtnLaunchService();
    }

    public void select_target_state() {

    }

}
