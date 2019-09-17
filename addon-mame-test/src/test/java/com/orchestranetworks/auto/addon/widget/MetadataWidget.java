package com.orchestranetworks.auto.addon.widget;

import java.util.List;


import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(MetadataWidgetImpl.class)
public interface MetadataWidget extends WidgetObject {
	boolean isMainSelected(String main);
	List<String> getListTab();
	List<String> getMetadatRecordView();
	void clickBtnPreviewRecord();
    void clickBtnPreviewGroup();
	
}
