package com.orchestranetworks.auto.addon.widget.workspace;

import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.LoadConfig;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.utils.Encode;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class DataspaceBriefInfoWidgetImpl extends BaseWidgetImpl implements DataspaceBriefInfoWidget {
    public DataspaceBriefInfoWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public String getTextIdentifier() {
        return getTextWithLabel("Identifier");
    }

    @Override
    public String getTextType() {
        return getTextWithLabel("Type");
    }

    @Override
    public String getTextOwner() {
        return getTextWithLabel("Owner");
    }

    @Override
    public String getTextStatus() {
        return getTextWithLabel("Status");
    }

    @Override
    public String getTextLoadingStrategy() {
        return getTextWithLabel("Loading strategy");
    }

    @Override
    public String getTextChildMergePolicy() {
        return getTextWithLabel("Child merge policy");
    }
    @Override
    public void deleteDataspaceByService() {
        RestAssured.baseURI = getBaseURL();
        String token = getLoginToken();
        String dataspace = Encode.of(SessionData.getValueFromSession(Constants.DATASPACE_IDENTIFIER));
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
        loginCredentials.addProperty("login", LoadConfig.getUserName());
        loginCredentials.addProperty("password", LoadConfig.getPassword());

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
