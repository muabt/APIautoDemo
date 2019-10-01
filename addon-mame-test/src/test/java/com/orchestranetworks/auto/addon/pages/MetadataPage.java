package com.orchestranetworks.auto.addon.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.MetadataWidgetImpl;


import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.widget.MetadataWidget;

public class MetadataPage extends BasePage {
    private MetadataWidget metadataWidget;

    public MetadataPage(WebDriver driver) {
        super(driver);
        this.metadataWidget = new MetadataWidgetImpl(this, null, 100);
    }
    public MetadataWidget getMetadata() {
        switchToIFrame(Constants.IFRAME_SERVICE);
        return metadataWidget;
    }
}