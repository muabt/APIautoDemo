package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(TableViewWidgetImpl.class)
public interface TableViewWidget extends WidgetObject {

    void selectFirstRecords(int numberOfRecords);

    void selectCheckboxWithText(String text);

    void selectLastRecord();

    void selectRecordWithPK(String[] primaryKey);

    void selectRecordWithPK(String selectRecordWithPk);

    void accessRecordWithText(String tableName);

    boolean existRecordInTable();
	
	void selectAllRecord();
	
	void clickBtnSelectAndSort();

    String get_text_data_cell(int rowInd, String colName);

}
