package com.orchestranetworks.auto.addon.base;

import java.util.List;
import java.util.concurrent.TimeUnit;

import com.orchestranetworks.auto.addon.Constants;
import org.junit.Assert;
import net.serenitybdd.core.annotations.findby.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.orchestranetworks.auto.addon.LogWork;

import io.appium.java_client.functions.ExpectedCondition;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.serenitybdd.core.pages.WidgetObjectImpl;
import net.thucydides.core.webelements.Checkbox;

public class BaseWidgetImpl extends WidgetObjectImpl {
    private static final String XPATH_IFRAME = "//iframe[not(@title='Text Resize Monitor')]";
    private static final String XPATH_NAVIGATION_PANEL = "//div[@class='_ebx-modeless-modal _ebx-modeless-modal-with-background']";

    public BaseWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public BaseWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private WebDriver getDriver() {
        return this.getPage().getDriver();
    }

    public WebElementFacade getElement(String xPath) {
        return getPage().find(By.xpath(xPath));
    }

    public void clickOnElement(String xPath) {
        getElement(xPath).waitUntilClickable().click();
    }

    public void clickByJS(String xPath) {
        executeJS("arguments[0].click();", xPath);
    }

    public void highlightElement(String xPath) {
        executeJS("arguments[0].style.border='3px solid red'", xPath);

    }

    public void executeJS(String script, String xpath) {
        ((JavascriptExecutor) getDriver()).executeScript(script, getElement(xpath));
    }

    public String getText(String xPath) {
        return getElement(xPath).getText();
    }

    public String getTextValue(String xPath) {
        return getElement(xPath).getTextValue().trim();
    }

    public String getTextWithLabel(String label) {
        String xPath = "//tr[descendant::*[text()='" + label + "']]/td[@class='ebx_Input']";
        return getText(xPath);
    }

    public boolean isElementExistNow(String xPath) {
        waitForAllLoadingCompleted();
        try {
            List<WebElementFacade> e = findAllElement(xPath);
            if (e.size() != 0) {
                highlightElement(xPath);
                return true;
            }
        } catch (Exception e) {
            LogWork.error("Element was not existed now");
        }
        return false;
    }

    public List<WebElementFacade> findAllElement(String xPath) {
        return getPage().findAll(xPath);
    }

    /**
     * =====================================IFRAME============================================================
     */
    public void switchToIFrame(String idIFrame) {
        getDriver().switchTo().frame(idIFrame);
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
        List<WebElement> iframes = getDriver().findElements(By.xpath(XPATH_IFRAME));
        while (iframes.size() > 0) {
            LogWork.info("Switch to IFrame has ID=" + iframes.get(0).getAttribute("id"));
            getDriver().switchTo().frame(iframes.get(0));
            iframes = getDriver().findElements(By.xpath(XPATH_IFRAME));
        }

    }

    public void switchToFirstIFrame() {
        switchOutDefaultIFrame();
        List<WebElement> iframes = getDriver().findElements(By.xpath(XPATH_IFRAME));
        LogWork.info("Switch to IFrame has ID=" + iframes.get(0).getAttribute("id"));
        getDriver().switchTo().frame(iframes.get(0));
    }

    /**
     * =====================================COMMON-WAIT============================================================
     */

    public void waitForAllLoadingCompleted() {
        waitUntilHTMLReady(30);
        waitForJQueryLoadingCompleted(30);
    }

    public void waitUntilHTMLReady(int timeoutInSeconds) {
        new FluentWait<WebDriver>(getDriver()).withTimeout(timeoutInSeconds, TimeUnit.SECONDS)
                .pollingEvery(100, TimeUnit.MILLISECONDS).until(new ExpectedCondition<Boolean>() {
            public Boolean apply(WebDriver d) {
                try {
                    JavascriptExecutor jsExec = (JavascriptExecutor) d;
                    return (Boolean) jsExec.executeScript("return document.readyState").toString()
                            .equals("complete");
                } catch (Exception e) {
                    return true;
                }
            }
        });
    }

    public void waitForJQueryLoadingCompleted(int timeoutInSeconds) {
        WebDriverWait wait = new WebDriverWait(getDriver(), timeoutInSeconds);
        // wait for jQuery to load
        ExpectedCondition<Boolean> jQueryLoad = new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                try {
                    return ((Long) ((JavascriptExecutor) getDriver()).executeScript("return $.active") == 0);
                } catch (Exception e) {
                    // no jQuery present
                    return true;
                }
            }
        };

        wait.until(jQueryLoad);
    }

    public WebElementFacade waitElementToBePresent(String xPath) {
        waitForAllLoadingCompleted();
        this.getPage().waitFor(ExpectedConditions.presenceOfElementLocated(By.xpath(xPath)));
        WebElementFacade foundElement = getElement(xPath);
        if (foundElement != null) {
            highlightElement(xPath);
        }
        return foundElement;
    }

    /**
     * Wait until element display on UI, timeout 30s
     *
     * @param xPath
     */
    public void waitForVisibilityOfElement(String xPath) {
        getDriver();
        WebDriverWait wait = new WebDriverWait(getDriver(), 30);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xPath)));
    }

    /**
     * Wait until element disappear from UI, timeout 30s
     *
     * @param xPath
     */
    public void waitForInvisibilityOfElement(String xPath) {
        getDriver();
        WebDriverWait wait = new WebDriverWait(getDriver(), 30);
        wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(xPath)));
    }

    public boolean waitUntilElementVisible(String xPath, int timeoutInSeconds) {
        try {
            this.getPage().setImplicitTimeout(50, TimeUnit.MILLISECONDS);
            waitForVisibilityOfElement(xPath);
            this.getPage().resetImplicitTimeout();
            return true;
        } catch (Exception e) {
            this.getPage().resetImplicitTimeout();
            return false;
        }
    }

    /**
     * Wait until element display on HTML, timeout 30s
     *
     * @param xPath
     * @author hue
     */
    public void waitForPresenceOfElement(String xPath) {
        getDriver();
        WebDriverWait wait = new WebDriverWait(getDriver(), 30);
        wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(xPath)));
    }

    /**
     * @param xPath
     * @author hue Wait until element disappear from HTML, timeout 30s
     */
    public void waitForNotPresenceOfElement(String xPath) {
        getDriver();
        WebDriverWait wait = new WebDriverWait(getDriver(), 30);
        wait.until(ExpectedConditions.not(ExpectedConditions.presenceOfAllElementsLocatedBy((By.xpath(xPath)))));
    }

    public void waitForClickabilityOfElement(String xPath) {
        getDriver();
        WebDriverWait wait = new WebDriverWait(getDriver(), 30);
        wait.until(ExpectedConditions.elementToBeClickable(By.xpath(xPath)));
    }

    /**
     * @param xPath
     * @author hue Wait until attribule of element to be a specific value,
     * timeout 30s
     */
    public void waitForAttributeToBe(String xPath, String attribute, String value) {
        getDriver();
        WebDriverWait wait = new WebDriverWait(getDriver(), 30);
        wait.until(ExpectedConditions.attributeToBe(By.xpath(xPath), attribute, value));
    }

    /**
     * =====================================BUTTON============================================================
     */
    /**
     * @param parentXpath
     * @param btnName
     * @param index
     * @return
     * @author hue
     */
    public String xPathBtn(String parentXpath, String btnName, int index) {
        String xPath = "(" + parentXpath
                + "//button[(@type='button' or @type='submit' or not(@type)) and not(@style='display: none;')][descendant-or-self::*[text()='"
                + btnName + "' or @title='" + btnName + "' or @value='" + btnName + "']])[" + index + "]";
        return xPath;
    }

    public String xPathBtn(String btnName, int index) {
        return xPathBtn("", btnName, index);
    }

    public String xPathBtn(String btnName) {
        return xPathBtn("", btnName, 1);
    }

    public WebElementFacade findBtn(String parentXpath, String btnName, int index) {
        return findBtn(xPathBtn(parentXpath, btnName, index));
    }

    public WebElementFacade findBtn(String btnName, int index) {
        return findBtn("", btnName, index);
    }

    public WebElementFacade findBtn(String btnName) {
        return findBtn("", btnName, 1);
    }

    /**
     * @param xPathParent
     * @param btnName
     * @param index
     * @author hue
     */
    public void clickBtn(String xPathParent, String btnName, int index) {
        scrollElementIntoView(xPathBtn(xPathParent, btnName, index)).click();
        waitForAllLoadingCompleted();
    }

    public void clickBtn(String xPathParent, String label) {
        clickBtn(xPathParent, label, 1);

    }

    public void clickBtn(String label, int index) {
        clickBtn("", label, index);
    }

    public void clickBtn(String label) {
        clickBtn("", label, 1);

    }

    /**
     * =====================================INPUT-FIELD============================================================
     */
    /**
     * This methods using to find elements is input field or textarea field
     *
     * @param parentXpath
     * @param label
     * @param index
     * @return
     * @author hue
     */
    public String xPathInputWithLabel(String parentXpath, String label, int index) {
        String xPath = "(" + parentXpath
                + "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[text()='" + label
                + "' or @title='" + label + "' or @value='" + label
                + "']]//*[(local-name() = 'input' and @type='text')  or local-name() = 'textarea'])[" + index + "] | ("
                + parentXpath + "//div[label[(.='" + label + "' or @title='" + label + "' or @value='" + label
                + "' ) and not(@style='display: none;')]]//*[(local-name() = 'input' and @type='text')  or local-name() = 'textarea'])["
                + index + "] | (//label[.='" + label + "' or @title='" + label + "' or @value='" + label
                + "']/parent::div/following-sibling::div//*[(local-name() = 'input' and @type='text')  or local-name() = 'textarea'])["
                + index + "]";

        return xPath;
    }

    public void waitTypeAndTabWithLabel(String parentXpath, String label, int index, String value) {
        waitElementToBePresent(xPathInputWithLabel(parentXpath, label, index)).clear();
        getElement(xPathInputWithLabel(parentXpath, label, index)).typeAndTab(value);
    }

    public void waitTypeAndTabWithLabel(String label, int index, String value) {
        waitTypeAndTabWithLabel("", label, index, value);
    }

    public void waitTypeAndTabWithLabel(String label, String value) {
        waitTypeAndTabWithLabel("", label, 1, value);
    }

    public void waitTypeAndTab(String xPath, String value) {
        WebElementFacade e = waitElementToBePresent(xPath);
        e.clear();
        e.typeAndTab(value);
    }

    public void waitTypeAndEnter(String xPath, String value) {
        WebElementFacade e = waitElementToBePresent(xPath);
        e.clear();
        e.typeAndEnter(value);
    }

    /**
     * =====================================RADIO-BOX============================================================
     */
    public String xPathRadioBoxWithLabel(String parentXpath, String label, int index) {
        String xPath = "(" + parentXpath + "//label[normalize-space(.)='" + label + "'  or text()='" + label
                + "'][child::input[@type='radio']])[" + index + "]";
        return xPath;
    }

    public void selectRadioBoxWithLabel(String parentXpath, String label, int index) {
        waitElementToBePresent(xPathRadioBoxWithLabel(parentXpath, label, index)).waitUntilClickable().click();

    }

    public void selectRadioBoxWithLabel(String label, int index) {
        selectRadioBoxWithLabel("", label, index);

    }

    public void selectRadioBoxWithLabel(String label) {
        selectRadioBoxWithLabel(label, 1);

    }

    public String xPathRadioBoxGroup(String parentXpath, String label, String value, int index) {
        String xPathRow = "(" + parentXpath
                + "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='" + label
                + "']]";
        return xPathRow + "//*[@class='ebx_RadioButtonGroup']//label[text()='" + value + "'])[" + index + "]";

    }

    public void selectRadioBoxGroup(String parentXpath, String label, String value, int index) {
        clickOnElement(xPathRadioBoxGroup(parentXpath, label, value, index));

    }

    public void selectRadioBoxGroup(String label, String value) {
        selectRadioBoxGroup("", label, value, 1);

    }

    /**
     * =====================================DROPDOWN-LIST============================================================
     */

    public void selectDDLBox(String label, String value) {
        String xPathDDL = " //div[label[ .='" + label
                + "'] and not(@style='display: none;')]//select | //tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='"
                + label + "']]//button[@title='Open drop-down list'] | //label[.='" + label
                + "']/parent::div/following-sibling::div//select";
        String xPathValue = xPathDDL + "/option[.='" + value + "']";
        clickOnElement(xPathDDL);
        waitElementToBePresent(xPathValue).waitUntilClickable().click();
    }

    public void selectDDLInput(String label, String value) {
        String xPathDDL = " //tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='"
                + label + "']]//button[@title='Open drop-down list']";
        String xPathValue = "//div[@id='ebx_ISS_pane' ]//div[(" + sSpecialTextPredicates(value)
                + " and string-length(normalize-space(text())=" + value.length()
                + ")) and (contains(@id,'ebx_ISS_Item') or contains(@class,'ebx_ISS_Item'))]";

        clickOnElement(xPathDDL);
        waitElementToBePresent(xPathValue).waitUntilClickable().click();
    }

    public String sSpecialTextPredicates(String givenText) {
        String[] tokens = givenText.split(" ");
        int numText = tokens.length;
        String resultsPattern = "";
        if (numText > 1) {
            resultsPattern = "contains(.,'" + tokens[0] + "')";
            for (int i = 1; i < numText; i++) {
                resultsPattern += " and contains(.,'" + tokens[i] + "')";
            }
            return resultsPattern + "and string-length(normalize-space(.=" + givenText.length() + "))";
        } else {
            return "contains(.,'" + givenText + "') and string-length(normalize-space(.=" + givenText.length() + "))";
        }
    }

    public void inputDDLThenTab(String label, String value) {
        String xPathDDL = " //tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='"
                + label + "']]//input[@type='text']";
        waitTypeAndTab(xPathDDL, value);
    }

    public void inputDDLThenEnter(String label, String value) {
        String xPathDDL = " //tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='"
                + label + "']]//input[@type='text']";
        WebElementFacade e = waitElementToBePresent(xPathDDL);
        e.clear();
        e.type(value);
        e.sendKeys(Keys.ENTER);
    }

    /**
     * =====================================CHECK-BOX============================================================
     */
    public String xPathCheckbox(String parentXpath, String label, int index) {
        String xPath = "(" + parentXpath + "//label[descendant-or-self::*[normalize-space(text())='" + label
                + "' or normalize-space(.)='" + label + "' or @value='" + label
                + "']][child::input[@type='checkbox']][not(ancestor::*[@style='display: none;'])])[" + index
                + "]/input";
        return xPath;
    }

    public void checkCheckbox(String parentXpath, String label, int index) {
        Checkbox chbx = new Checkbox(getElement(xPathCheckbox(parentXpath, label, index)));
        chbx.setChecked(true);
        Assert.assertEquals(true, chbx.isChecked());
    }

    public void checkCheckbox(String label) {
        checkCheckbox("", label, 1);
    }

    public void uncheckCheckbox(String parentXpath, String label, int index) {
        Checkbox chbx = new Checkbox(getElement(xPathCheckbox(parentXpath, label, index)));
        chbx.setChecked(false);
        Assert.assertEquals(false, chbx.isChecked());
    }

    public void uncheckCheckbox(String label) {
        uncheckCheckbox("", label, 1);
    }

    /**
     * =====================================SCROLL============================================================
     */
    public WebElementFacade scrollElementIntoView(String xPath) {
        executeJS("arguments[0].scrollIntoView(false);", xPath);
        highlightElement(xPath);
        return getElement(xPath);
    }

    public WebElementFacade scrollElementIntoCenterView(String xPath) {
        executeJS("arguments[0].scrollIntoView(true);", xPath);
        highlightElement(xPath);
        return getElement(xPath);
    }

    /**
     * =====================================TABLE============================================================
     */

    /**
     * Get column index with column name in table default view
     *
     * @param colName
     * @return
     * @author hue
     */
    public int getColumnIndexWithLabel(String colName) {
        String xPathTable = "//div[@id='ebx_workspaceTable_headerContainer']";
        String xPathHeader = xPathTable + "//th[contains(@id,'ebx_workspaceTable_tableField')]";
        int colIndex = 0;
        int listCol = findBy(xPathTable).thenFindAll(xPathHeader).size();
        for (int i = 1; i <= listCol; i++) {
            String xPathColumn = "(" + xPathHeader + ")[" + i + "]//span[@class='ebx_RawLabel']";
            if (isElementExistNow(xPathColumn)) {
                if (getText(xPathColumn).equals(colName)) {
                    colIndex = i;
                    break;
                }
            }
        }
        return colIndex;
    }

    public int getRowIndexWithLabel(String label) {
        String xPathTable = "//div[@id='ebx_workspaceTable_fixedScroller']//table[@class='ebx_tvFixed']";
        String xPathRows = xPathTable + "/tbody/tr";
        int rowIndex = 0;
        int listCol = findBy(xPathTable).thenFindAll(xPathRows).size();
        for (int i = 1; i <= listCol; i++) {
            String xPathRow = xPathTable + "/tbody/tr[" + i + "]/td[2]";
            if (getTextValue(xPathRow).equals(label)) {
                rowIndex = i;
                break;
            }

        }
        return rowIndex;
    }

    public String getTextDataCell(int rowInd, int colInd) {
        String xpathDataCell = "((//div[@id='ebx_workspaceTable_container']//tr[contains(@class,'ebx')][" + rowInd
                + "]//td[not(*) and not(@class='ebx_tvInheritanceCell'  or @class='ebx_tvSelectCell') ]) | (//div[@id='ebx_workspaceTable_container']//tr[contains(@class,'ebx')]["
                + rowInd
                + "]//td[child::div[not(*) and not(@class='ebx_tvInheritanceCell'  or @class='ebx_tvSelectCell') ]]))["
                + colInd + "]";
        return getTextValue(xpathDataCell);

    }

    protected void waitAbit(long millisecond) {
        try {
            Thread.sleep(millisecond);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    protected void removeChooseDatasetDiv() {
        waitForAllLoadingCompleted();
        boolean isPresent = getPage().findAll(XPATH_NAVIGATION_PANEL).size() > 0;
        if (isPresent) {
            executeJS(Constants.JS_HIDDEN, XPATH_NAVIGATION_PANEL);
            executeJS(Constants.JS_HIDDEN,
                    "//div[@class='_ebx-modeless _ebx-modeless_with-shadow _ebx-navigation-menu-selector_modeless']");
            waitForInvisibilityOfElement(XPATH_NAVIGATION_PANEL);
        }
    }
}
