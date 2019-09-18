package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.*;
import com.orchestranetworks.auto.addon.widget.general.*;


import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidgetImpl;
import org.openqa.selenium.WebDriver;


public class ManualMergePages extends BasePage {
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private TableViewWidget tableViewWidget;
    private RelationWidget relationWidget;
    private SummaryWidget summaryWidget;
    private PreviewWidget previewWidget;
    private FooterWidget footerWidget;
    private ItemCreationWidget itemCreationWidget;
    private RecordDetailWidget recordDetailWidget;
    private ToolbarWidget toolbarWidget;

    public ManualMergePages(WebDriver driver) {
        super(driver);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.tableViewWidget = new TableViewWidgetImpl(this, null, 100);
        this.relationWidget = new RelationWidgetImpl(this, null, 100);
        this.previewWidget = new PreviewWidgetImpl(this, null, 100);
        this.summaryWidget = new SummaryWidgetImpl(this, null, 100);
        this.footerWidget = new FooterWidgetImpl(this, null, 100);
        this.itemCreationWidget = new ItemCreationWidgetImpl(this,null,100);
        this.recordDetailWidget = new RecordDetailWidgetImpl(this, null, 100);
        this.toolbarWidget = new ToolbarWidgetImpl(this, null, 100);
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


    public TableViewWidget getActualTableName() {
        return tableViewWidget;
    }

    public FooterWidget getFooterWidget() {
        return footerWidget;
    }

    public ItemCreationWidget getItemCreationWidget() {
        return itemCreationWidget;
    }

    public RecordDetailWidget getRecordDetailWidget() {
        return recordDetailWidget;
    }

    public ToolbarWidget getToolbarWidget(){
        return toolbarWidget;
    }
}
