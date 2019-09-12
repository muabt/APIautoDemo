package com.orchestranetworks.auto.addon.widget;

import java.util.List;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ManageGroupImpl.class)
public interface ManageGroupWidget extends WidgetObject {
	List<List<String>> getDataDuplicatesTable();
	List<List<String>> getDataSuspectsTable();
	 void clickBtnClose();

}
