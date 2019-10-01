package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ImportWidgetImpl.class)
public interface ImportWidget extends WidgetObject {
	
	void selectFileThenImport(String fileName);
	
	void clickBtnImport();

}
