package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(DataspaceBriefInfoWidgetImpl.class)
public interface DataspaceBriefInfoWidget extends WidgetObject {
    String getTextIdentifier();
    String getTextType();
    String getTextOwner();
    String getTextStatus();
    String getTextLoadingStrategy();
    String getTextChildMergePolicy();
    void deleteDataspaceByService(String dataspaceName);
    void deleteDataspaceByService();
}
