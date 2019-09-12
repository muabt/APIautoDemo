package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.general.FooterWidget;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;

import net.serenitybdd.core.pages.PageObject;

public class TabularViewPage extends PageObject {
	private ToolbarWidget toolbar;
	private NavigationWidget navPanel;
	private HeaderWidget headerWidget;
	private FooterWidget footerWidget;

	private ItemCreationWidget newDataSet;

	public TabularViewPage() {
		this.toolbar = toolbar;
		this.navPanel = navPanel;
		this.headerWidget = headerWidget;
		this.footerWidget = footerWidget;
		this.newDataSet = newDataSet;
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

	public ItemCreationWidget getDefaultViewWidget() {
		return newDataSet;
	}

}
