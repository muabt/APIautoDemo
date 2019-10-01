package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.workspace.*;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.*;
import com.orchestranetworks.auto.addon.widget.ManualMergeViewWidget;
import com.orchestranetworks.auto.addon.widget.ManualMergeViewWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.*;

public class ManualMergePage extends BasePage {
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private ManualMergeViewWidget manualMergeViewWidget;
    private com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget defaultViewWidget;

    private RelationWidget relationWidget;
    private SummaryWidget summaryWidget;
    private PreviewWidget previewWidget;
    private FooterWidget footerWidget;
    private ItemCreationWidget itemCreationWidget;
    private RecordDetailWidget recordDetailWidget;
    private ToolbarWidget toolbarWidget;
    private AdministrationWidget administrationWidget;
    private PopupWidget popupWidget;

    public ManualMergePage(WebDriver driver) {
        super(driver);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.manualMergeViewWidget = new ManualMergeViewWidgetImpl(this, null, 100);
        this.relationWidget = new RelationWidgetImpl(this, null, 100);
        this.previewWidget = new PreviewWidgetImpl(this, null, 100);
        this.summaryWidget = new SummaryWidgetImpl(this, null, 100);
        this.footerWidget = new FooterWidgetImpl(this, null, 100);
        this.itemCreationWidget = new ItemCreationWidgetImpl(this, null, 100);
        this.recordDetailWidget = new RecordDetailWidgetImpl(this, null, 100);
        this.toolbarWidget = new ToolbarWidgetImpl(this, null, 100);
        this.defaultViewWidget = new DefaultViewImpl(this, null, 100);
        this.popupWidget = new PopupWidgetImpl(this, null, 100);
    }

    public NavigationWidget getNavPanel() {
        return navPanel;
    }

    public HeaderWidget getHeader() {
        return header;
    }

    public ManualMergeViewWidget getManualMergeViewWidget() {
        switchToIFrame("serviceIframe");
        return manualMergeViewWidget;
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


    public ManualMergeViewWidget getActualTableName() {
        return manualMergeViewWidget;
    }

    public PopupWidget getPopupWidget() {
        return popupWidget;
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
