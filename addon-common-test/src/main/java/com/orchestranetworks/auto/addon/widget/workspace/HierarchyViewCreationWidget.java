package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ChooseDatasetTypeWidgetImpl.class)
public interface HierarchyViewCreationWidget extends WidgetObject {
    void selectDimension(String dimension);

    void selectDisplayRecordInNewWindow(boolean isSelect);

    void selectDisplayOrphans(boolean isSelect);

    void selectDisplayRootNode(boolean isSelect);

    void selectPruneHierarchy(boolean isSelect);

    void selectNonMatchingChildren(boolean isSelect);

    void selectRemoveRecursiveRootLeaves(boolean isSelect);

    void selectDetectCycle(boolean isSelect);

    void inputLabelEnglich(String label);

    void selectFilter(String filter);

    void selectCriterion(String criterion);

    void clickBtnAddLogicalBlock();

    void clickBtnRemoveAllCriteria();

    void selectFilterOnLinkTable(String filter);

    void selectCriterionOnLinkTable(String criterion);

    void clickBtnAddLogicalBlockLinkTable();

    void clickBtnRemoveAllCriteriaLinkTable();
}
