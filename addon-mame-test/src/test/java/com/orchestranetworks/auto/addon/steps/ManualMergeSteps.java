package com.orchestranetworks.auto.addon.steps;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.LinkedHashMap;
import java.util.List;

import com.orchestranetworks.auto.addon.LogWork;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.pages.DatasetPage;
import com.orchestranetworks.auto.addon.pages.ManualMergePages;
import org.assertj.core.api.SoftAssertions;
import org.junit.Assert;

public class ManualMergeSteps {

    ManualMergePages onManualMergePages;
    DatasetPage onDatasetPage;

    public void verify_record_view_table(List<List<String>> expectedTbl) {
        List<List<String>> actualTbl = onManualMergePages.getTableViewWidget().getDataRecordViewTable();
        compare_record_view_tbl(expectedTbl,actualTbl );
        verify_record_view_cell_highlighted(expectedTbl);


    }

    private void verify_record_view_cell_highlighted(List<List<String>> expectedTbl) {
        List<String> expectedHeader = expectedTbl.get(0);
        for (int row = 1; row < expectedTbl.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedTbl.get(row).get(col);
                boolean isHighlighted = onManualMergePages.getTableViewWidget().isCellHighlighted(row, col);
                if (expectedCell.contains("{H}")) {
                    assertTrue(isHighlighted);
                } else {
                    assertFalse(isHighlighted);
                }
            }
        }
    }

    private   void compare_record_view_tbl(List<List<String>> expectedTb, List<List<String>> actualTb) {
        SoftAssertions softAssertions = SessionData.softAssert();
        List<String> expectedHeader = expectedTb.get(0);
        List<String> actualHeader = actualTb.get(0);

        assertThat(actualTb.size()).isEqualTo(expectedTb.size()).withFailMessage("Number of rows is not equal, expected:" + expectedTb.size() + ", but was:"
                + actualTb.size());
        assertThat(expectedHeader).isEqualTo(actualHeader).withFailMessage("Number of column is not equal, expected:" + expectedHeader.size() + ", but was:"
                + actualHeader.size());

        for (int row = 0; row <expectedTb.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedTb.get(row).get(col);
                String actualCell = actualTb.get(row).get(col);
                if (expectedCell.contains("- {H}")) {
                    expectedCell.replace("- {H}", "").trim();
                }
                softAssertions.assertThat(expectedCell).isEqualTo(expectedCell);
            }
        }
        softAssertions.assertAll();
    }

    public void verify_table_preview(List<List<String>> expectedTablePreview) {
        List<List<String>> actualTablePreview = onManualMergePages.getTableViewWidget().getDataPreviewTable();
        assertEquals(expectedTablePreview, actualTablePreview);

    }

    public void click_button_next() {
        onManualMergePages.getPreviewWidget().clickBtnNext();
    }

    public void click_button_merge() {
        onManualMergePages.getPreviewWidget().clickBtnMerge();
    }

    public void verify_name_of_buttons(String name) {
        switch (name) {
            case "Reset":
                assertEquals(name, onManualMergePages.getTableViewWidget().getTextOfRightBtn());
                break;
            case "Cancel last action":
                assertEquals(name, onManualMergePages.getTableViewWidget().getTextOfCancelActionButton());
                break;
            case "Apply merge policy":
                assertEquals(name, onManualMergePages.getTableViewWidget().getTextOfRightBtn());
                break;
        }
    }

    public void verify_status_of_buttons(String status) {
        Assert.assertEquals(status, onManualMergePages.getTableViewWidget().isBtnCancelLastActionActive());
    }

    public void verify_name_of_table(String tableName) {
        Assert.assertEquals(tableName, onManualMergePages.getTableViewWidget().getMergeStepsSelection());
    }



}
