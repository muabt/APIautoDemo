package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.general.*;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.LoadConfig;

import net.serenitybdd.core.pages.PageObject;

public class CommonPage extends PageObject {
    private ToolbarWidget toolbar;
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private FooterWidget footer;
    private LoginWidget login;
    private UserCardWidget userCard;

    public CommonPage(WebDriver driver) {
        super(driver);
        this.toolbar = new ToolbarWidgetImpl(this, null, 100);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.footer = new FooterWidgetImpl(this, null, 100);
        this.login = new LoginWidgetImpl(this, null, 100);
        this.userCard = new UserCardWidgetImpl(this, null, 100);
    }

    public ToolbarWidget getToolbar() {
        return toolbar;
    }

    public NavigationWidget getNavPanel() {
        return navPanel;
    }

    public HeaderWidget getHeader() {
        return header;
    }

    public FooterWidget getFooter() {
        return footer;
    }

    public LoginWidget getLogin() {
        return login;
    }

    public UserCardWidget getUserCard() {
        return userCard;
    }

    public void access_login_page() {
        open();
        clearCache();
        getDriver().navigate().to(LoadConfig.getURL());
        getDriver().manage().window().maximize();
    }

    private void clearCache() {
        getDriver().manage().deleteAllCookies();
        JavascriptExecutor jsExec = (JavascriptExecutor) getDriver();
        jsExec.executeScript(Constants.JS_LOCAL_STORAGE_CLEAR);
        jsExec.executeScript(Constants.JS_SESSION_STORAGE_CLEAR);
    }

}
