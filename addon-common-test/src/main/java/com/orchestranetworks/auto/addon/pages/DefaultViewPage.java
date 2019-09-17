package com.orchestranetworks.auto.addon.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.filter.SearchWidget;
import com.orchestranetworks.auto.addon.widget.filter.SearchWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.FooterWidget;
import com.orchestranetworks.auto.addon.widget.general.FooterWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidget;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidgetImpl;
import com.orchestranetworks.auto.addon.widget.workspace.DefaultViewImpl;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;

import net.serenitybdd.core.pages.PageObject;

public class DefaultViewPage extends BasePage {
	private ToolbarWidget toolbar;
	private SearchWidget textSearch;
	private SearchWidget validationSearch;
	private SearchWidget fuzzySearch;
	private NavigationWidget navPanel;
	private HeaderWidget headerWidget;
	private FooterWidget footerWidget;

	private TableViewWidget defaultViewWidget;

	public DefaultViewPage(WebDriver driver) {
		super(driver);
		this.toolbar = new ToolbarWidgetImpl(this, null, 100);
		this.textSearch = new SearchWidgetImpl(this, null, 100);
		this.validationSearch = new SearchWidgetImpl(this, null, 100);
		this.navPanel = new NavigationWidgetImpl(this, null, 100);
		this.headerWidget = new HeaderWidgetImpl(this, null, 100);
		this.footerWidget = new FooterWidgetImpl(this, null, 100);
		this.defaultViewWidget = new DefaultViewImpl(this, null, 100);
	}

	public ToolbarWidget getToolbar() {
		return toolbar;
	}

	public SearchWidget getTextSearch() {
		textSearch.switchToFilterPanel();
		return textSearch;
	}

	public SearchWidget getValidationSearch() {
		validationSearch.switchToFilterPanel();
		return validationSearch;
	}

	public SearchWidget getFuzzySearch() {
		fuzzySearch.switchToFilterPanel();
		return fuzzySearch;
	}

	public HeaderWidget getHeader() {
		return headerWidget;
	}

	public FooterWidget getFooterWidget() {
		return footerWidget;
	}

	public TableViewWidget getDefaultViewWidget() {
		switchToLastIFrame();
		return defaultViewWidget;
	}
		
	

}
