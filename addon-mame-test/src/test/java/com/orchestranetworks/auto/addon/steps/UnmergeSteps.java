package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.RunMatchPage;
import com.orchestranetworks.auto.addon.pages.UnmergePage;
import net.thucydides.core.annotations.Step;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class UnmergeSteps {
    private UnmergePage onUnmergePage;
    @Step
    public void verify_message_unmerge_service_popup(String message) {
        assertThat(onUnmergePage.getPopupWidget().getTextPopup()).isEqualTo(message);
        onUnmergePage.getPopupWidget();
    }
}
