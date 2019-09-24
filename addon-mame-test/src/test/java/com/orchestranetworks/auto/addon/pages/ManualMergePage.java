package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.workspace.*;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.PreviewWidget;
import com.orchestranetworks.auto.addon.widget.PreviewWidgetImpl;
import com.orchestranetworks.auto.addon.widget.RelationWidget;
import com.orchestranetworks.auto.addon.widget.RelationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.SummaryWidget;
import com.orchestranetworks.auto.addon.widget.SummaryWidgetImpl;
import com.orchestranetworks.auto.addon.widget.TableViewWidget;
import com.orchestranetworks.auto.addon.widget.TableViewWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.FooterWidget;
import com.orchestranetworks.auto.addon.widget.general.FooterWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidget;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidgetImpl;


public class ManualMergePage extends BasePage {
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private TableViewWidget tableViewWidget;
    private com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget defaultViewWidget;

    private RelationWidget relationWidget;
    private SummaryWidget summaryWidget;
    private PreviewWidget previewWidget;
    private FooterWidget footerWidget;
    private ItemCreationWidget itemCreationWidget;
    private RecordDetailWidget recordDetailWidget;
    private ToolbarWidget toolbarWidget;
    private AdministrationWidget administrationWidget;

    public ManualMergePage(WebDriver driver) {
        super(driver);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.tableViewWidget = new TableViewWidgetImpl(this, null, 100);
        this.relationWidget = new RelationWidgetImpl(this, null, 100);
        this.previewWidget = new PreviewWidgetImpl(this, null, 100);
        this.summaryWidget = new SummaryWidgetImpl(this, null, 100);
        this.footerWidget = new FooterWidgetImpl(this, null, 100);
        this.itemCreationWidget = new ItemCreationWidgetImpl(this, null, 100);
        this.recordDetailWidget = new RecordDetailWidgetImpl(this, null, 100);
        this.toolbarWidget = new ToolbarWidgetImpl(this, null, 100);
        this.defaultViewWidget = new DefaultViewImpl(this, null, 100);
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

    public ToolbarWidget getToolbarWidget() {
        return toolbarWidget;
    }

    public com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget getDefaultview() {
        return defaultViewWidget;
    }

    public AdministrationWidget getAdministrationWidget(){
        return administrationWidget;
    }
}
