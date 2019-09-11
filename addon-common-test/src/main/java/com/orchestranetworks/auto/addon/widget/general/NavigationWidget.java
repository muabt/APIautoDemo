package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(NavigationWidgetImpl.class)
public interface NavigationWidget extends WidgetObject {
	void changeDataspace();

	void changeDataset();

	void expandNavigationItems();

	void expandNavigationItem(String[] menu);

	void collapseNavigationItems();

	void collapseNavigationItem(String menu);

	void accessNavigationItem(String menu);

}
