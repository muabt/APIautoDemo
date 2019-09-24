package com.orchestranetworks.auto.addon;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import com.google.gson.JsonObject;
import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.assertj.core.util.Strings;

import net.thucydides.core.ThucydidesSystemProperty;
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;

public class LoadConfig {

    private static Properties OBJECT = null;
    private static Properties CONFIG = null;
    static String fseparator = File.separator;

    private static EnvironmentVariables env = SystemEnvironmentVariables.createEnvironmentVariables();

    public static Properties loading_config_sys(String fileName) throws IOException {
        FileInputStream fs = null;
        try {
            fs = new FileInputStream(System.getProperty("user.dir") + fseparator + fileName);
            CONFIG = new Properties();
            CONFIG.load(fs);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        return CONFIG;
    }

    public static String getSystemProperties(String propName, String propKey) {
        String propValue = "";
        try {
            propValue = System.getProperty(propName);
            if (CONFIG == null) {
                CONFIG = LoadConfig.loading_config_sys("serenity.properties");
            }
            if (Strings.isNullOrEmpty(propValue)) {
                propValue = CONFIG.getProperty(propKey);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return propValue;
    }

    public static String getUserName() {
        return getSystemProperties("name", "user.name");
    }

    public static String getPassword() {
        return getSystemProperties("pass", "user.pass");
    }

    public static String getLanguage() {
        String language = getSystemProperties("language", "language");
        if (language == null) {
            language = "en_US";
        }
        LogWork.info("Get LANGUAGE config: " + language);
        return language;
    }

    public static String getURL() {
        return env.getProperty(ThucydidesSystemProperty.WEBDRIVER_BASE_URL);
    }

    public static String getDownloadFolder() {
        return env.getProperty("chrome_preferences.download.default_directory");
    }

    public static String getDriverExecution() {
        return env.getProperty("webdriver.chrome.driver");
    }

    public static String getDriverHeadless() {
        return env.getProperty("chrome.switches");
    }

    private static String getLoginToken() {
        JsonObject loginCredentials = new JsonObject();
        loginCredentials.addProperty("login", getUserName());
        loginCredentials.addProperty("password", getPassword());

        RequestSpecification httpRequest = RestAssured.given()
				.contentType(ContentType.JSON)
                .body(loginCredentials.toString());

        Response response = httpRequest.post(getBaseURL()+"/ebx-ui/rest/authentication/v1/token/create");
        JsonPath jsonRes = new JsonPath(response.asString());

        String token = jsonRes.getString("tokenType") + " " + jsonRes.getString("accessToken");
        return token;
    }

    private static String getBaseURL() {
        String url = getURL();
        int end = url.indexOf("/ebx");
        url = url.substring(0, end);
        return url;

    }

    public static RequestSpecification requestSpecification() {
        RequestSpecification spec = new RequestSpecBuilder()
				.setBaseUri(getBaseURL())
				.setContentType("application/json")
				.addHeader("Authorization",getLoginToken())
				.setUrlEncodingEnabled(false)
				.build();
        return spec;
    }
}
