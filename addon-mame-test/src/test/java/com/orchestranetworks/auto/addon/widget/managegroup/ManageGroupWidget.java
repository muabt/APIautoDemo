package com.orchestranetworks.auto.addon.widget.managegroup;

import java.util.List;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ManageGroupWidgetImpl.class)
public interface ManageGroupWidget extends WidgetObject {
    List<List<String>> getDataDuplicatesTable();
    List<String> getDataSuspectsTable();
    String getNoRecordFound();
}
