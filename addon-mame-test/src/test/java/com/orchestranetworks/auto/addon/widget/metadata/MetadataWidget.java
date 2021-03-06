package com.orchestranetworks.auto.addon.widget.metadata;

import java.util.List;


import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(MetadataWidgetImpl.class)
public interface MetadataWidget extends WidgetObject {
	boolean isMainSelected();
	List<String> getListTab();
	List<List<String>> getMetadataRecordView();
	void clickBtnPreviewRecord();
    void clickBtnPreviewGroup();
    void clickBtnClose();
    List<List<String>> getDataRecordDetail();
	String getHeaderManageGroup();
	String getHeaderMetadata();
	String getTextAutoCreatedRecord();
	void doubleClick();
//	MetadataWidgetImpl clickBtnAction();
//	void clickBtnMetadata();
}
