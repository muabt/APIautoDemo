package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(NavigationWidgetImpl.class)
public interface NavigationWidget extends WidgetObject {
	NavigationWidget changeDataspace();

	NavigationWidget changeDataset();

	void expandAllNavigationItems();

	void expandNavigationItem(String[] menu);

	void collapseAllNavigationItems();

	void collapseNavigationItem(String menu);

	void accessNavigationItem(String menu);

    void goToPath(String path);

    void selectDatasetService(String service);

    void goToGroupAdministration(String path);

    void goToAdministrationItem(String path);

	NavigationWidget selectAdministrationFeature();

	boolean isDataspaceExist(String dataspace);
	
	void clickOnActionsAndImportService();
}
