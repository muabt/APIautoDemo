package com.orchestranetworks.auto.addon.widget.workspace;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

import java.util.List;

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

    String getTextDataCell(int rowInd, String colName);

    JsonObject getRecordWithPK(String pk, List<String> header);

    JsonArray getDefaultViewTable();

}
