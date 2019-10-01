package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.widget.filter.SearchWidget;
import com.orchestranetworks.auto.addon.widget.filter.TextSearchImpl;
import com.orchestranetworks.auto.addon.widget.workspace.DefaultViewImpl;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.general.FooterWidget;
import com.orchestranetworks.auto.addon.widget.general.FooterWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidget;
import com.orchestranetworks.auto.addon.widget.general.HeaderWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.ImportWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.PopupWidget;
import com.orchestranetworks.auto.addon.widget.general.PopupWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidgetImpl;
import com.orchestranetworks.auto.addon.widget.workspace.AdministrationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.AdministrationWidgetImpl;

public class AdministrationPage extends BasePage {
    public SearchWidget textSearch;
    private ToolbarWidget toolbar;
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private FooterWidget footer;
    private PopupWidget popup;
    private AdministrationWidget administration;
    private TableViewWidget defaultViewWidget;
    private ImportWidget importWidget;


    public AdministrationPage(WebDriver driver) {
        super(driver);
        this.toolbar = new ToolbarWidgetImpl(this, null, 100);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.footer = new FooterWidgetImpl(this, null, 100);
        this.popup = new PopupWidgetImpl(this, null, 100);
        this.administration = new AdministrationWidgetImpl(this, null, 100);
        this.defaultViewWidget = new DefaultViewImpl(this, null, 100);
        this.textSearch = new TextSearchImpl(this, null, 100);
    }

    public ToolbarWidget getToolbar() {
        return toolbar;
    }

    public NavigationWidget getNavPanel() {
        switchToIFrame(Constants.IFRAME_LEGACY);
        return navPanel;
    }

    public HeaderWidget getHeader() {
        return header;
    }

    public FooterWidget getFooter() {
        return footer;
    }

    public PopupWidget getPopup() {
        return popup;
    }

    public AdministrationWidget getAdministration() {
        return administration;
    }

    public TableViewWidget getDefaultViewWidget() {
        switchToLastIFrame();
        return defaultViewWidget;
    }

    public SearchWidget getTextSearch() {
        return textSearch;
    }

	public ImportWidget getImportWidget() {
		return importWidget;
	}
}
