package com.orchestranetworks.auto.addon.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.general.FooterWidget;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;

public class RecordDetailPage extends BasePage {
	private ToolbarWidget toolbar;
	private NavigationWidget navPanel;
	private HeaderWidget headerWidget;
	private FooterWidget footerWidget;
	private RecordDetailWidget recordDetailWidget;

	private TableViewWidget defaultViewWidget;
	private ItemCreationWidget itemCreationWidget;

	public RecordDetailPage(WebDriver driver) {
		super(driver);
		/*this.toolbar = toolbar;
		this.navPanel = navPanel;
		this.headerWidget = headerWidget;
		this.footerWidget = footerWidget;
		this.defaultViewWidget = defaultViewWidget;
		this.itemCreationWidget = itemCreationWidget;*/
	}

	public ToolbarWidget getToolbar() {
		return toolbar;
	}

	public HeaderWidget getHeaderWidget() {
		return headerWidget;
	}

	public FooterWidget getFooterWidget() {
		return footerWidget;
	}

	public TableViewWidget getDefaultViewWidget() {
		return defaultViewWidget;
	}
	
	public ItemCreationWidget getItemCreationWidget() {
		return itemCreationWidget;
	}

	public RecordDetailWidget getRecordDetailWidget() {
		return recordDetailWidget;
	}

	public void setRecordDetailWidget(RecordDetailWidget recordDetailWidget) {
		this.recordDetailWidget = recordDetailWidget;
	}

}
