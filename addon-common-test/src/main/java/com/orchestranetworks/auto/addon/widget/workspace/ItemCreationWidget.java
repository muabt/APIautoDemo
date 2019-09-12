package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ItemWidgetCreationImpl.class)
public interface ItemCreationWidget extends WidgetObject {
	void enterIdentifier(String id);

	void enterUniqueName(String uniqueName);

	void enterOwner(String owner);

	void enterEnglishLabel(String label);

    void selectOwner(String owner);
}
