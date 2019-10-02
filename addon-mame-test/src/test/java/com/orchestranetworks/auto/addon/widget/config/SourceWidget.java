package com.orchestranetworks.auto.addon.widget.config;

import com.google.inject.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(SourceWidgetImpl.class)
public interface SourceWidget extends WidgetObject {

    void selectCheckboxWithPK(String[] pks);

}
