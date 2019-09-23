package com.orchestranetworks.auto.addon.pages;

import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.SessionData;
import io.restassured.RestAssured;
import io.restassured.authentication.PreemptiveBasicAuthScheme;
import io.restassured.http.ContentType;
import io.restassured.http.Headers;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;
import com.orchestranetworks.auto.addon.widget.general.*;
import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.LoadConfig;

import net.serenitybdd.core.pages.PageObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
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

    public CommonPage(WebDriver driver) {
        super(driver);
        this.toolbar = new ToolbarWidgetImpl(this, null, 100);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.footer = new FooterWidgetImpl(this, null, 100);
        this.login = new LoginWidgetImpl(this, null, 100);
        this.userCard = new UserCardWidgetImpl(this, null, 100);
        this.popup = new PopupWidgetImpl(this, null, 100);
    }


    public ToolbarWidget getToolbar() {
        switchToIFrame(Constants.IFRAME_LEGACY);
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

    public PopupWidget getPopupWidget() {
        return popup;
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

    public void delete_dataspace_by_service() {
        RestAssured.baseURI = getBaseURL();
        String token = getLoginToken();
        String dataspace = SessionData.getValueFromSession(Constants.DATASPACE_IDENTIFIER);
        System.out.println(token);
        RequestSpecification httpRequest = RestAssured.given()
                .contentType(ContentType.JSON)
                .header("Authorization", token)
                .urlEncodingEnabled(false)
                .queryParam("deleteDataOnClose", "true")
                .accept("application/json").log().all();

        Response response = httpRequest.post("/ebx-dataservices/rest/data/v1/B" + dataspace + ":close");
        response.then().assertThat().statusCode(204);
    }

    private String getLoginToken() {
        RestAssured.baseURI = getBaseURL();
        JsonObject loginCredentials = new JsonObject();
        loginCredentials.addProperty("login", "admin");
        loginCredentials.addProperty("password", "onvn");

        RequestSpecification httpRequest = RestAssured.given().contentType("application/json")
                .body(loginCredentials.toString());

        Response response = httpRequest.post("/ebx-ui/rest/authentication/v1/token/create");
        JsonPath jsonRes = new JsonPath(response.asString());

        String token = jsonRes.getString("tokenType") + " " + jsonRes.getString("accessToken");
        return token;
    }

    private String getBaseURL() {
        String url = LoadConfig.getURL();
        url = url.substring(0, url.indexOf(".com") + 4);
        return url;

    }


}
