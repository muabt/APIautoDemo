package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.*;
import com.orchestranetworks.auto.addon.widget.general.*;



import org.openqa.selenium.WebDriver;


public class ManualMergePages extends BasePage {
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private TableViewWidget tableViewWidget;
    private RelationWidget relationWidget;
    private SummaryWidget summaryWidget;
    private PreviewWidget previewWidget;
    private FooterWidget footerWidget;

    public ManualMergePages(WebDriver driver) {
        super(driver);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.tableViewWidget = new TableViewWidgetImpl(this, null, 100);
        this.relationWidget = new RelationWidgetImpl(this, null, 100);
        this.previewWidget = new PreviewWidgetImpl(this, null, 100);
        this.summaryWidget = new SummaryWidgetImpl(this, null, 100);
        this.footerWidget = new FooterWidgetImpl(this, null, 100);
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
    
    			
    public TableViewWidget getTextOfResetBtn() {
		tableViewWidget.getTextOfResetBtn();
		return tableViewWidget;
	}
	
	public TableViewWidget getValueCancelLastAction (String status) {
		tableViewWidget.getValueCancelLastAction(status);
		return tableViewWidget;
	}

	public TableViewWidget getTextOfCancelActionButton() {
		tableViewWidget.getTextOfCancelActionButton();
		return tableViewWidget;
			
	}
	public TableViewWidget getActualTableName() {
		tableViewWidget.getActualTableName();
		return tableViewWidget;
	}
	public FooterWidget getFooterWidget() {
        return footerWidget;
    }

}
