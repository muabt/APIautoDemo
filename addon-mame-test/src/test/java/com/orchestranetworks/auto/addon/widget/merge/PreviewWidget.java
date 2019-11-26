package com.orchestranetworks.auto.addon.widget.merge;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(PreviewWidgetImpl.class)
public interface PreviewWidget extends WidgetObject {
    void clickBtnMerge();
    void clickBtnNext();
    void waitForMergeSuccessful() ;
}
