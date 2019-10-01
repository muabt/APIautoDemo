package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.filter.AdvancedSearchImpl;
import com.orchestranetworks.auto.addon.widget.filter.SearchWidget;
import com.orchestranetworks.auto.addon.widget.general.*;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.LoadConfig;

import java.util.concurrent.TimeUnit;

@DefaultUrl("http://automation.vn.orchestranetworks.com/ebx-ui/")
public class CommonPage extends BasePage {
    private ToolbarWidget toolbar;
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private FooterWidget footer;
    private LoginWidget login;
    private UserCardWidget userCard;
    private PopupWidget popup;
    private SearchWidget advanceSearch;
    private SearchWidget textSearch;

    public CommonPage(WebDriver driver) {
        super(driver);
    }


    public ToolbarWidget getToolbar() {
       switchToIFrame(Constants.IFRAME_LEGACY);
        return toolbar;
    }

    public NavigationWidget getNavPanel() {
        switchOutDefaultIFrame();
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

    public PopupWidget getPopupWidget() {
        return popup;
    }

    public SearchWidget getAdvanceSearch(){
        return  advanceSearch;
    }

    public SearchWidget getTextSearch(){
        return textSearch;
    }

    public void access_login_page() {
        open();
        clearCache();
        getDriver().navigate().to(LoadConfig.getURL());
        getDriver().manage().window().maximize();
        setImplicitTimeout(100, TimeUnit.MILLISECONDS);
    }

    private void clearCache() {
        getDriver().manage().deleteAllCookies();
        JavascriptExecutor jsExec = (JavascriptExecutor) getDriver();
        jsExec.executeScript(Constants.JS_LOCAL_STORAGE_CLEAR);
        jsExec.executeScript(Constants.JS_SESSION_STORAGE_CLEAR);
    }




}
