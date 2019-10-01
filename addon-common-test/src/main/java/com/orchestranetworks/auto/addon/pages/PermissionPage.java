package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.general.FooterWidget;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;

import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebDriver;

public class PermissionPage extends BasePage {
	private ToolbarWidget toolbar;
	private NavigationWidget navPanel;
	private HeaderWidget headerWidget;
	private FooterWidget footerWidget;
	private ItemCreationWidget fieldCreationWidget;

	private TableViewWidget defaultViewWidget;

	public PermissionPage(WebDriver driver) {
		super(driver);
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

    public ItemCreationWidget getFieldCreationWidget() {
        return fieldCreationWidget;
    }

}
