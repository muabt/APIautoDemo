package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(FooterWidgetImpl.class)
public interface FooterWidget extends WidgetObject {
	void clickBtnNext();

	void clickBtnBack();

	void clickBtnCancel();

	void clickBtnSave();

	void clickBtnSaveAndClose();

	void clickBtnSaveAndCloseInInternalPopup();

	void clickBtnClose();

	// Screen View creation
	void clickBtnCreate();

	void clickBtnCreateAndApply();

	// Screen View modification
	void clickBtnSaveAndQuit();
	
	void clickBtnSubmit();

	void clickBtnCreateAndAdd();
}
