package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ChooseDatamodelTypeWidgetImpl.class)
public interface ChooseDatamodelTypeWidget extends WidgetObject {
    void clickBtnSemanticModel();
    void clickBtnRelationalModel();
}
