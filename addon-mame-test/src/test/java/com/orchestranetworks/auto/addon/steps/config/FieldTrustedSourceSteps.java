package com.orchestranetworks.auto.addon.steps.config;

import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.config.FieldTrustedSourcePage;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;

public class FieldTrustedSourceSteps {
    FieldTrustedSourcePage onFieldTrustedSourcePage;
    CommonPage onCommonPage;

    @Step
    public void access_field_trusted_source() {
        onFieldTrustedSourcePage.getNavPanel().goToPath(MAMEConstants.PATH_TO_FIELD_TRUSTED_SOURCE);
    }

    @Step
    public void click_create_record() {
        onFieldTrustedSourcePage.getToolbar().clickBtnCreateRecord();
    }


    @Step
    public void select_matching_table(String matchingTable) {
        Serenity.setSessionVariable(MAMEConstants.MATCHING_TABLE).to(matchingTable);
        onFieldTrustedSourcePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.MATCHING_TABLE, matchingTable);
    }

    @Step
    public void add_trusted_source_list(String trustedSourceList) {
        String[] sourceList = trustedSourceList.split(",");
        for (int i = 0; i < sourceList.length; i++) {
            onFieldTrustedSourcePage.getRecordDetailWidget().addAnOccurrence();
            onFieldTrustedSourcePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.TRUSTED_SOURCE_LIST, sourceList[i].trim());
        }
    }

    @Step
    public void select_field_trusted_source(String field) {
        onFieldTrustedSourcePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.FIELD, field);
    }

}
