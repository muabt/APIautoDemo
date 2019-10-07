package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.LoadConfig;
import com.orchestranetworks.auto.addon.utils.SessionData;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.utils.Encode;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import net.serenitybdd.core.pages.PageObject;

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
    public void deleteDataspaceByService(String dataspaceName) {
        dataspaceName = Encode.of(dataspaceName);
        RequestSpecification httpRequest = RestAssured.given()
                .spec(LoadConfig.requestSpecification())
                .queryParam("deleteDataOnClose", "true")
                .log().all();

        Response response = httpRequest.post("/ebx-dataservices/rest/data/v1/B" + dataspaceName + ":close");
        System.out.println("Status code : " + response.statusCode());
        response.then().assertThat().statusCode(204);
    }

    @Override
    public void deleteDataspaceByService() {
       String dataspaceName = Encode.of(SessionData.getValueFromSession(Constants.DATASPACE_IDENTIFIER));
        RequestSpecification httpRequest = RestAssured.given()
                .spec(LoadConfig.requestSpecification())
                .queryParam("deleteDataOnClose", "true")
                .log().all();

        Response response = httpRequest.post("/ebx-dataservices/rest/data/v1/B" + dataspaceName + ":close");
        response.then().assertThat().statusCode(204);
    }
}
