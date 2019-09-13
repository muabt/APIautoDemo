package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(TableViewWidgetImpl.class)
public interface TableViewWidget extends WidgetObject {
	
    void selectFirstRecords(int numberOfRecords);
       
    void selectRecordWithPK(String[] primaryKey);
    
    void selectRecordWithPK(String selectRecordWithPk);
}
