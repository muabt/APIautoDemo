package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.general.*;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.filter.SearchWidget;
import com.orchestranetworks.auto.addon.widget.filter.SearchWidgetImpl;
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
    private PopupWidget popupWidget;
    private SearchWidget searchWidget;

    private TableViewWidget defaultViewWidget;

    public DefaultViewPage(WebDriver driver) {
        super(driver);
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

    public SearchWidget getSearchWidget() {
        return searchWidget;
    }

    public PopupWidget getPopupWidget() {
        return popupWidget;
    }

}
