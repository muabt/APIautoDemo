package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.ManualMergePage;
import com.orchestranetworks.auto.addon.pages.TabularViewPage;
import com.orchestranetworks.auto.addon.pages.UnmergePage;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.Assertions;
import org.assertj.core.api.SoftAssertions;

import java.util.List;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class UnmergeSteps {
    private UnmergePage onUnmergePage;
    private TabularViewPage onTabularViewPage;
    ManualMergePage manualMergePage;
    @Step
    public void verify_message_unmerge_service_popup(String message) {
        assertThat(onUnmergePage.getPopupWidget().getTextExceptionPopup()).isEqualTo(message);
        onUnmergePage.getPopupWidget();
    }

    @Step
    public void verify_business_table(List<List<String>> expectedBusinessTbl) {
        List<List<String>> actualBusinessTbl= onTabularViewPage.getDefaultViewWidget().getBusinessDataTable();
        compare_business_table(expectedBusinessTbl, actualBusinessTbl);
    }



    private void compare_business_table(List<List<String>> expectedBusinessTbl, List<List<String>> actualBusinessTbl) {
        SoftAssertions softAssertions = SessionData.softAssert();
        List<String> expectedHeader = expectedBusinessTbl.get(0);
        List<String> actualHeader = actualBusinessTbl.get(0);

        Assertions.assertThat(actualBusinessTbl.size()).isEqualTo(expectedBusinessTbl.size()).withFailMessage("Number of rows is not equal, expected:" + expectedBusinessTbl.size() + ", but was:"
                + actualBusinessTbl.size());
        Assertions.assertThat(expectedHeader).isEqualTo(actualHeader).withFailMessage("Number of column is not equal, expected:" + expectedHeader + ", but was:"
                + actualHeader);

        for (int row = 0; row < expectedBusinessTbl.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedBusinessTbl.get(row).get(col);
                String actualCell = actualBusinessTbl.get(row).get(col);
                if (expectedCell.contains(MAMEConstants.HIGHLIGHT_SYNTAX)) {
                    expectedCell = expectedCell.replace(MAMEConstants.HIGHLIGHT_SYNTAX, "").trim();
                }
                softAssertions.assertThat(actualCell).isEqualTo(expectedCell);
            }
        }
        softAssertions.assertAll();
    }


}
