package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

import java.util.List;

@ImplementedBy(RecordDetailWidgetImpl.class)
public interface RecordDetailWidget extends WidgetObject {
	
	void clickOnTabOfLabel(String label);

    void selectTab(String tabName);

	void selectRadioButton(String label, String value);

    void addAnOccurrence();

    List<List<String>> getRecordDetail();
    
    void viewRecordWithText(String label);

    String getTooltip(String field);

    void clickShowDetailTooltip(String field);

    void closeTooltipOfField(String field);

    void clickBtnPreview();

    void viewRecordWithTextWithDecorator(String label);

}
