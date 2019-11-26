package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.RunMatchPage;

import net.thucydides.core.annotations.Step;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class RunMatchSteps {

    private static final String MATCH_AGAINST = "Records to match against";

    private RunMatchPage onRunMatchPage;

    @Step
    public void input_run_match(String label, String option) {
        onRunMatchPage.switchOutDefaultIFrame();
        onRunMatchPage.switchToIFrame(Constants.IFRAME_LEGACY);
        onRunMatchPage.switchToLastIFrame();
        onRunMatchPage.getRunMatchWidget().selectRecordToMatchAgainst(label, option);
    }

    @Step
    public void click_on_run_match() {
        onRunMatchPage.getRunMatchWidget().clickBtnRunMatch();
    }

    @Step
    public void verify_message_run_match_service_popup(String message) {
        assertThat(onRunMatchPage.getPopupWidget().getPopupContent()).isEqualTo(message);
        onRunMatchPage.getPopupWidget().confirmOK();
    }

    @Step
    public void view_record_with_name(String tab, String label) {
        onRunMatchPage.getRecordDetailWidget().selectTab(tab);
        onRunMatchPage.getRecordDetailWidget().viewRecordWithText(label);
        onRunMatchPage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        onRunMatchPage.getItemCreationWidget().clickBtnExpand();
    }

    @Step
    public void view_matching_field_record_with_name(String tab, String label) {
        onRunMatchPage.getRecordDetailWidget().selectTab(tab);
        onRunMatchPage.getRecordDetailWidget().viewRecordWithTextWithDecorator(label);
        onRunMatchPage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        onRunMatchPage.getItemCreationWidget().clickBtnExpand();
    }


}
