package com.orchestranetworks.auto.addon.steps;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;

import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import com.orchestranetworks.auto.addon.pages.ManualMergePage;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.SoftAssertions;

import org.junit.Assert;

public class ManualMergeSteps {

    ManualMergePage onManualMergePage;

    @Step
    public void verify_record_view_table(List<List<String>> expectedTbl) {
        List<List<String>> actualTbl = onManualMergePage.getManualMergeViewWidget().getDataRecordViewTable();
        compare_record_view_tbl(expectedTbl, actualTbl);
        verify_record_view_cell_highlighted(expectedTbl);
    }

    private void verify_record_view_cell_highlighted(List<List<String>> expectedTbl) {
        List<String> expectedHeader = expectedTbl.get(0);
        for (int row = 1; row < expectedTbl.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedTbl.get(row).get(col);
                boolean isHighlighted = onManualMergePage.getManualMergeViewWidget().isCellHighlighted(row, col);
                if (expectedCell.contains("{H}")) {
                    assertTrue(isHighlighted);
                } else {
                    assertFalse(isHighlighted);
                }
            }
        }
    }

    @Step
    private void compare_record_view_tbl(List<List<String>> expectedTb, List<List<String>> actualTb) {
        SoftAssertions softAssertions = SessionData.softAssert();
        List<String> expectedHeader = expectedTb.get(0);
        List<String> actualHeader = actualTb.get(0);

        assertThat(actualTb.size()).isEqualTo(expectedTb.size()).withFailMessage("Number of rows is not equal, expected:" + expectedTb.size() + ", but was:"
                + actualTb.size());
        assertThat(actualHeader).isEqualTo(expectedHeader).withFailMessage("Number of column is not equal, expected:" + expectedHeader + ", but was:"
                + actualHeader);

        for (int row = 0; row < expectedTb.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedTb.get(row).get(col);
                String actualCell = actualTb.get(row).get(col);
                if (expectedCell.contains(MAMEConstants.HIGHLIGHT_SYNTAX)) {
                    expectedCell = expectedCell.replace(MAMEConstants.HIGHLIGHT_SYNTAX, "").trim();
                }
                softAssertions.assertThat(actualCell).isEqualTo(expectedCell);
            }
        }
        softAssertions.assertAll();
    }

    @Step
    public void verify_table_preview(List<List<String>> expectedTablePreview) {
        List<List<String>> actualTablePreview = onManualMergePage.getManualMergeViewWidget().getDataPreviewTable();
        assertEquals(expectedTablePreview, actualTablePreview);

    }

    @Step
    public void click_button_next() {
        onManualMergePage.getPreviewWidget().clickBtnNext();
    }

    @Step
    public void click_button_merge() {
        onManualMergePage.getPreviewWidget().clickBtnMerge();
    }


    @Step
    public void verify_status_of_buttons(String status) {
        assertThat(status).isEqualTo(onManualMergePage.getManualMergeViewWidget().isBtnCancelLastActionActive());
    }

    @Step
    public void verify_name_of_table(String tableName) {
        Assert.assertEquals(tableName, onManualMergePage.getManualMergeViewWidget().getMergeStepsSelection());
    }

    @Step
    public void verify_name_of_buttons(String name) {
        switch (name) {
            case MAMEConstants.RESET:
            case MAMEConstants.APPLY_MERGE_POLICY:
                assertEquals(name, onManualMergePage.getManualMergeViewWidget().getTextOfRightBtn());
                break;
            case MAMEConstants.CANCEL_LAST_ACTION:
                assertEquals(name, onManualMergePage.getManualMergeViewWidget().getTextOfCancelActionButton());
                break;
        }
    }

    @Step
    public void click_btn_save() {
        onManualMergePage.getFooterWidget().clickBtnSave();
    }

    @Step
    public JsonObject getRecordTable(String recordID, List<String> headerList) {
        return onManualMergePage.getDefaultViewWidget().getRecordWithPK(recordID, headerList);
    }

    @Step
    public void close_error_popup() {
        onManualMergePage.switchOutDefaultIFrame();
        onManualMergePage.getPopupWidget().clickBtnClose();
        onManualMergePage.switchToIFrame(Constants.IFRAME_LEGACY);
    }

    @Step
    public void select_checkbox_with_text(String label) {
        onManualMergePage.getDefaultViewWidget().selectCheckboxWithText(label);
    }

    @Step
    public void select_table_service(String service) {
        onManualMergePage.getToolbarWidget().clickBtnActions().selectService(service);
    }

    @Step
    public void confirm_popup() {
        onManualMergePage.getPopupWidget().confirmOK();
    }

    public String get_groupID() {
       return onManualMergePage.getDefaultViewWidget().getTextDataCell(1,"groupId");
    }

    public void verify_exception_error_popup (String expectedError) {
      String actual =  onManualMergePage.getPopupWidget().getTextExceptionPopup();
      assertThat(actual).isEqualTo(expectedError);
    }
}
