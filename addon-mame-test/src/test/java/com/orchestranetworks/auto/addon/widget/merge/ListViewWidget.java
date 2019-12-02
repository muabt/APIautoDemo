package com.orchestranetworks.auto.addon.widget.merge;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ListViewWidgetImpl.class)
public interface ListViewWidget extends WidgetObject {
    void selectRelationValue(String fieldLabel,String value);
}
