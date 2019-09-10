package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ChooseDatasetTypeWidgetImpl.class)
public interface ChooseDatasetTypeWidget extends WidgetObject {
    void clickBtnPackagedDataModel();
    void clickBtnSemanticModel();
    void clickBtnRelationalModel();
}
