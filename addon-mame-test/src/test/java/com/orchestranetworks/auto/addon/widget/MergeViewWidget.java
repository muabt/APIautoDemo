package com.orchestranetworks.auto.addon.widget;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(MergeViewWidgetImpl.class)
public interface MergeViewWidget extends WidgetObject {
    void clickBtnNext();
    void clickBtnCancel();
    void clickBtnApplyMergePolicy();
    void clickBtnUndo();
    void changeMergeStep(String step);
}
