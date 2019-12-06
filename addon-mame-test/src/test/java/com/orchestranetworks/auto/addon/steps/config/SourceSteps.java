package com.orchestranetworks.auto.addon.steps.config;

import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.config.SourcePage;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class SourceSteps extends ScenarioSteps {
    SourcePage onSourcePage;
    CommonPage onCommonPage;

    @Step
    public void access_source_table() {
        onSourcePage.getNavPanel().goToPath(MAMEConstants.PATH_TO_SOURCE);
    }

    @Step
    public void click_create_record() {
        onSourcePage.getToolbarWidget().clickBtnCreateRecord();
    }

    @Step
    public void input_name_of_source(String nameOfSource) {
        String inputCode = nameOfSource.equals(Constants.RANDOM) ? onCommonPage.getRandomString() : nameOfSource;
        Serenity.setSessionVariable(MAMEConstants.NAME_OF_SOURCE).to(inputCode);
        onSourcePage.getItemCreationWidget().inputTextWithLabel(MAMEConstants.NAME_OF_SOURCE, inputCode);
    }

    @Step
    public void input_description(String description) {
        onSourcePage.getItemCreationWidget().inputTextWithLabel(MAMEConstants.DESCRIPTION, description);
    }

    @Step
    public boolean is_code_existed(String mergePolicyCode) {
        return onSourcePage.getDefaultViewWidget().isRecordWithPKExisted(mergePolicyCode);
    }

    @Step
    public boolean is_pk_existed(String[] pks) {
        return onSourcePage.getDefaultViewWidget().isRecordExistedWithPK(pks);
    }
    @Step
    public void select_checkbox_with_text(String label) {
        onSourcePage.getDefaultViewWidget().selectCheckboxWithText(label);
    }

    @Step
    public void select_table_service(String service) {
        onSourcePage.getToolbarWidget().clickBtnActions().selectService(service);
    }

    @Step
    public void confirm_popup() {
        onSourcePage.getPopupWidget().confirmOK();
    }

    @Step
    public void select_source_with_name(String nameOfSource) {
        onSourcePage.getDefaultViewWidget().accessRecordWithText(nameOfSource);
    }

    @Step
    public void select_source_record_with_name(String name){
       // onSourcePage.getDefaultViewWidget().selectCheckboxWithText(name);
        onCommonPage.getDefaultViewWidget().selectRecordWithPK(name);
    }
    @Step
    public void delete_selected_record() {
        onSourcePage.getToolbarWidget().clickBtnActions().selectService(Constants.DELETE_SERVICE);
        onSourcePage.getPopupWidget().confirmOK();
    }
}
