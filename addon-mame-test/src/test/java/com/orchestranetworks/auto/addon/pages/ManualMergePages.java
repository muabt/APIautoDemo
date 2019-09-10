package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.*;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidget;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidgetImpl;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.common.WebPageObject;

public class ManualMergePages extends WebPageObject {
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private TableViewWidget tableViewWidget;
    private RelationWidget relationWidget;
    private SummaryWidget summaryWidget;
    private PreviewWidget previewWidget;

    public ManualMergePages(WebDriver driver, PreviewWidget preview) {
        super(driver);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.tableViewWidget = new TableViewWidgetImpl(this, null, 100);
        this.relationWidget = new RelationWidgetImpl(this, null, 100);
        this.previewWidget = new PreviewWidgetImpl(this, null, 100);
        this.summaryWidget = new SummaryWidgetImpl(this, null, 100);
    }

    public NavigationWidget getNavPanel() {
        return navPanel;
    }

    public HeaderWidget getHeader() {
        return header;
    }

    public TableViewWidget getTableViewWidget() {
        switchToIFrame("serviceIframe");
        return tableViewWidget;
    }

    public PreviewWidget getPreviewWidget() {
        return previewWidget;
    }
    public RelationWidget getRelationWidget() {
        return relationWidget;
    }

    public SummaryWidget getSummaryWidget() {
        return summaryWidget;
    }
}
