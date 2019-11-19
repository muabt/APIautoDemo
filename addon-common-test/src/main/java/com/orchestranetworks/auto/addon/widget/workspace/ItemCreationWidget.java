package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

import java.util.List;

@ImplementedBy(ItemCreationWidgetImpl.class)
public interface ItemCreationWidget extends WidgetObject {

    void enterIdentifier(String id);

    void enterUniqueName(String uniqueName);

    void enterEnglishLabel(String label);

    void selectOwner(String owner);

    void inputFieldContent(String col, String cell, String dataType);

    void clickProfile();

    void chooseProfile();

    void inputDDLWithLabel(String label, String value);

    void inputDDLThenEnter(String label, String selectionMode);

    void selectRadioBoxWithLabel(String label, String value);

    void selectDDLByJS(String label, String value);

    void selectDDLByJSWithIndex(String label, int index, String value);

    void clickBtnWithLabel(String label, String value);

    void clearDDL(String label);

    String getTextErrorDataModelField();

    String getTextErrorTableField();

    String getTextErrorDataModelInBlock();

    String getTextErrorTableInBlock();

    String getErrorBlock();

    void clickBtnExpand();

    void inputTextWithLabel(String label, String value);

    String getTextValidationMessage(String fieldName);

    List<List<String>> getBusinessDataTable();

    void expandAll();
}
