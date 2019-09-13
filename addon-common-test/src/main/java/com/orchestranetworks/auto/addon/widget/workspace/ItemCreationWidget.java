package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ItemCreationWidgetImpl.class)
public interface ItemCreationWidget extends WidgetObject {

	void enterIdentifier(String id);

	void enterUniqueName(String uniqueName);

	void enterEnglishLabel(String label);

	void selectOwner(String owner);

	void inputFieldContent(String col, String cell, String dataType);

	void inputDateTime(String label, String datetime);

	void clickProfile();

	void chooseProfile();
}
