package com.orchestranetworks.auto.addon.widget.workspace;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.common.TableObject;
import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

import java.util.List;

@ImplementedBy(TableViewWidgetImpl.class)
public interface TableViewWidget extends WidgetObject {

    void selectFirstRecords(int numberOfRecords);

    void selectCheckboxWithText(String text);

    void selectLastRecord();

    void selectRecordWithPK(List<String> primaryKey);

    void selectRecordWithPK(String selectRecordWithPk);
    
    void accessRecordWithText(String label);

    boolean isRecordInTableExisted();

    void selectAllRecord();

    void clickBtnSelectAndSort();

    String getTextDataCell(int rowInd, String colName);

    JsonObject getRecordWithPK(String pk, List<String> header);

    TableObject getDefaultViewTable(String tblName);

    boolean verifyMAMEConfigRecordExisted(String dataModel, String table);

    boolean isRecordWithPKExisted(String pk);

    boolean isRecordExistedWithPK(String[] pks);

}
