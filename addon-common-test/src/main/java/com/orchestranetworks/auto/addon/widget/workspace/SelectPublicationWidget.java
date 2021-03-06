package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(SelectPublicationWidgetImpl.class)
public interface SelectPublicationWidget extends WidgetObject {
    void selectPublication(String publicationName);
}
