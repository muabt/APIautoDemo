package com.orchestranetworks.auto.addon.widget;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

import java.util.List;

@ImplementedBy(TableViewWidgetImpl.class)
public interface TableViewWidget extends WidgetObject {
    void clickBtnNext();
    void clickBtnCancel();
    void clickBtnApplyMergePolicy();
    void clickBtnCancelLastAction();
    void changeMergeStep(String step);
    List<List<String>> getDataRecordViewTable();
    boolean isCellHighlighted(int row, int col);
    List<List<String>> getDataPreviewTable();
    String getTextOfRightBtn();
    String isBtnCancelLastActionActive();
    String getTextOfCancelActionButton();
    String getMergeStepsSelection();

}
