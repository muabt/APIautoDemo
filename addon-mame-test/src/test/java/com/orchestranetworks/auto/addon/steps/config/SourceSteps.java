package com.orchestranetworks.auto.addon.steps.config;

import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.config.SourcePage;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;

public class SourceSteps {
    SourcePage onSourcePage;
    CommonPage onCommonPage;
    @Step
    public void access_source_table() {
        onSourcePage.getNavPanel().goToPath("Reference data > Trusted source > Source");
    }


    @Step
    public void click_create_record() {
        onSourcePage.getToolbarWidget().clickBtnCreateRecord();
    }

    @Step
    public void input_name_of_source(String nameOfSource) {
        String inputCode = nameOfSource.equals("RANDOM") ? onCommonPage.getRandomString() : nameOfSource;
        Serenity.setSessionVariable(MAMEConstants.NAME_OF_SOURCE).to(inputCode);
        onSourcePage.getItemCreationWidget().inputTextWithLabel("Name of source", inputCode);
    }

    @Step
    public void input_description(String description) {
        onSourcePage.getItemCreationWidget().inputTextWithLabel("Description", description);
    }

    @Step
    public boolean is_code_existed(String mergePolicyCode) {
        return onSourcePage.getDefaultViewWidget().isRecordWithPKExisted(mergePolicyCode);
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


}
