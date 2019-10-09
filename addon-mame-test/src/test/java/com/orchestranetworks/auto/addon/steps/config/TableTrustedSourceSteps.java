package com.orchestranetworks.auto.addon.steps.config;

import com.orchestranetworks.auto.addon.pages.config.TableTrustedSourcePage;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class TableTrustedSourceSteps extends ScenarioSteps {
    TableTrustedSourcePage onTableTrustedSourcePage;


    @Step
    public void access_table_trusted_source() {
        onTableTrustedSourcePage.getNavPanel().goToPath(MAMEConstants.PATH_TO_TABLE_TRUSTED_SOURCE);
    }


    @Step
    public void click_create_record() {
        onTableTrustedSourcePage.getToolbar().clickBtnCreateRecord();
    }


    @Step
    public void select_matching_table(String matchingTable) {
        Serenity.setSessionVariable(MAMEConstants.MATCHING_TABLE).to(matchingTable);
        onTableTrustedSourcePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.MATCHING_TABLE, matchingTable);
    }

    @Step
    public void add_trusted_source_list(String trustedSourceList) {
        String[] sourceList = trustedSourceList.split(",");
        for (int i = 0; i < sourceList.length; i++) {
            onTableTrustedSourcePage.getRecordDetailWidget().addAnOccurrence();
            onTableTrustedSourcePage.getItemCreationWidget().selectDDLByJSWithIndex(MAMEConstants.TRUSTED_SOURCE_LIST, (i + 1), sourceList[i].trim());
        }
    }
}
