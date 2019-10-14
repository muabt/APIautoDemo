package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.utils.LogWork;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.pages.PageObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Random;

public class BasePage extends PageObject {
    private static final String XPATH_IFRAME = "//iframe[not(@title='Text Resize Monitor')]";

    @Managed(uniqueSession = true)
    protected WebDriver driver;

    public BasePage(WebDriver driver) {
        super();
        this.driver = driver;
    }


    public void switchToIFrame(String idIFrame) {
        if (isIFrameExisted(idIFrame)) {
            getDriver().switchTo().frame(idIFrame);
        }
    }

    public void switchOutDefaultIFrame() {
        LogWork.info("Switch out to default iframe");
        getDriver().switchTo().defaultContent();
    }

    public void switchOutParentIFrame() {
        getDriver().switchTo().parentFrame();
    }

    public void switchToLastIFrame() {
        switchOutDefaultIFrame();
        List<WebElement> iframes = driver.findElements(By.xpath(XPATH_IFRAME));
        while (iframes.size() > 0) {
            LogWork.info("Switch to IFrame has ID=" + iframes.get(0).getAttribute("id"));
            driver.switchTo().frame(iframes.get(0));
            iframes = driver.findElements(By.xpath(XPATH_IFRAME));
            LogWork.info("Message test Null poiter");
        }

    }

    public void switchToFirstIFrame() {
        switchOutDefaultIFrame();
        List<WebElement> iframes = driver.findElements(By.xpath(XPATH_IFRAME));
        LogWork.info("Switch to IFrame has ID=" + iframes.get(0).getAttribute("id"));
        driver.switchTo().frame(iframes.get(0));
    }

    private boolean isIFrameExisted(String id) {
        List<WebElement> iframes = getDriver().findElements(By.xpath(XPATH_IFRAME));
        for (int i = 0; i < iframes.size(); i++) {
            if (id.equals(iframes.get(i).getAttribute("id"))) {
                return true;
            }
        }
        return false;
    }


    public String getRandomString() {
        String CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder st = new StringBuilder();
        Random rnd = new Random();
        while (st.length() < 5) { // length of the random string.
            int index = (int) (rnd.nextFloat() * CHARS.length());
            st.append(CHARS.charAt(index));
        }
        return st.toString();
    }

}
