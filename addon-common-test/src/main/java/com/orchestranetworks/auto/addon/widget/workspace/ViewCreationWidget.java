package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ChooseDatasetTypeWidgetImpl.class)
public interface ViewCreationWidget extends WidgetObject {
    void selectDisplayedColumn(String columnName);
    void selectDisplayableColumn(String columnName);
    void clickBtnMoveToTopDC();
    void clickBtnMoveUpDC();
    void clickBtnMoveDownDC();
    void clickBtnMoveToBottomDC();
    void clickBtnMoveLeftDC();
    void clickBtnMoveRightDC();
    void clickBtnMoveAllLeftDC();
    void clickBtnMoveAllRightDC();
    void selectDMOrdering(boolean check);
    void selectSortedColumn(String columnName);
    void selectSortableColumn(String columnName);
    void clickBtnMoveToTopSC();
    void clickBtnMoveUpSC();
    void clickBtnMoveDownSC();
    void clickBtnMoveToBottomSC();
    void clickBtnMoveLeftSC();
    void clickBtnMoveRightSC();
    void clickBtnMoveAllLeftSC();
    void clickBtnMoveAllRightSC();
    void selectFilterCondition(String filter);
    void selectAddCriterion(String criteriion);
    void clickAddLogicalBlock();
    void clickRemoveAllCriteria();
    void selectPaginationLimit(String limit);
    void selectGridEdit(boolean enabled);
    void selectToolBarOnTableTop(String toolbarName);
    void selectToolBarOnTableRow(String toolbarName);

}
