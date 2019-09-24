package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy (AdministrationWidgetImpl.class)
public interface AdministrationWidget extends WidgetObject{

	void selectAnAdminFeature();
	boolean verifyCodeExisted(String mergePolicyCode);
}
