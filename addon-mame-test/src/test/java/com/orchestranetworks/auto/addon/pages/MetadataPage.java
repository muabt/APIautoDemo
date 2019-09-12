package com.orchestranetworks.auto.addon.pages;

import java.util.List;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.ManageGroupWidget;
import com.orchestranetworks.auto.addon.widget.MetadataImpl;
import com.orchestranetworks.auto.addon.widget.MetadataWidget;

public class MetadataPage {
  private MetadataWidget metadataWidget;
  private  ManageGroupWidget manageGroupWidget;

  
  public MetadataPage (WebDriver driver, PreviewWidget preview) {
      super(driver);
      this.metadataWidget = new MetadataImpl(this, null, 100);
      this.manageGroupWidget = new ManageGroupWidgetImpl (this, null, 100);
}
  public MetadataWidget  getMetadata() {
      return metadataWidget;
  }
  
  public ManageGroupWidget  getmanageGroup() {
      return manageGroupWidget;
  }
  
}