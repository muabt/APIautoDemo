package com.orchestranetworks.auto.addon;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.WebDriverWait;

import io.appium.java_client.functions.ExpectedCondition;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.Managed;

public class WebPageObject extends PageObject {
	@Managed(uniqueSession = true)
	protected WebDriver driver;
	private static String downloadFolder = System.getProperty("user.dir");
	private static final String ATT_ID = "id";
	private static final String ATT_TITLE = "title";
	private static final String ATT_NAME = "name";
	private static final String XPATH_IFRAME = "//iframe[not(@title='Text Resize Monitor')]";

	public WebPageObject(WebDriver driver) {
		super();
		this.driver = driver;
	}

	/**
	 * =====================================COMMON============================================================
	 */

	public WebElementFacade findBy(String attribute, String value) {
		return $("//*[@" + attribute + "='" + value + "']");
	}

	/**
	 * Find all elements with specific Xpath
	 * 
	 * @author hue
	 * @param xPath
	 * @return
	 */
	public List<WebElementFacade> findAllElement(String xPath) {
		return findAll(xPath);
	}

	public void clickOnElement(WebElementFacade e) {
		highlightElement(e);
		e.waitUntilClickable().click();
		waitABit(1000);
	}

	public void clickOnElement(String xPath) {
		waitElementToBePresent(xPath).click();
		waitForAllLoadingCompleted();
	}

	public void clickByJS(String xPath) {
		((JavascriptExecutor) getDriver()).executeScript("arguments[0].click();", findBy(xPath));
		waitABit(15);
	}

	public void highlightElement(WebElement el) {
		getDriver();
		try {
			((JavascriptExecutor) driver).executeScript("arguments[0].style.border='3px solid red'", el);
		} catch (Exception e) {
		}
	}

	public boolean isElementExistNow(String xPath) {
		waitForAllLoadingCompleted();
		try {
			List<WebElementFacade> subDataCellResults = withTimeoutOf(120, TimeUnit.MILLISECONDS).findAll(xPath);
			if (subDataCellResults.size() != 0) {
				highlightElement(subDataCellResults.get(0));
				return true;
			}
		} catch (Exception e) {
		}
		return false;
	}

	public String getText(String xPath) {
		return getElement(xPath).getText();
	}

	public String getAttributeValue(String xPath, String attribute) {
		return getElement(xPath).getAttribute(attribute);
	}

	public String getTextValue(String xPath) {
		return getElement(xPath).getTextValue().trim();
	}

	public WebElementFacade getElement(String xPath) {
		return waitElementToBePresent(xPath);
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
		List<WebElement> iframes = driver.findElements(By.xpath(XPATH_IFRAME));
		while (iframes.size() > 0) {
			LogWork.info("Switch to IFrame has ID=" + iframes.get(0).getAttribute("id"));
			driver.switchTo().frame(iframes.get(0));
			iframes = driver.findElements(By.xpath(XPATH_IFRAME));
		}

	}

	public void switchToFirstIFrame() {
		switchOutDefaultIFrame();
		List<WebElement> iframes = driver.findElements(By.xpath(XPATH_IFRAME));
		LogWork.info("Switch to IFrame has ID=" + iframes.get(0).getAttribute("id"));
		driver.switchTo().frame(iframes.get(0));
	}

	/**
	 * =====================================COMMON-WAIT============================================================
	 */
	public void waitAbit(long milisecond) {
		waitABit(milisecond);
	}

	public void waitForAllLoadingCompleted() {
		waitABit(150);
		waitUntilHTMLReady(40);
		waitForJQueryLoadingCompleted(40);

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
		waitFor(ExpectedConditions.presenceOfElementLocated(By.xpath(xPath)));
		WebElementFacade foundElement = findBy(xPath);
		if (foundElement != null) {
			highlightElement(findBy(xPath));
		}
		return foundElement;
	}

	/**
	 * Wait until element display on UI, timeout 30s
	 * 
	 * @param xPath
	 */
	// Display on UI
	public void waitForVisibilityOfElement(String xPath) {
		getDriver();
		WebDriverWait wait = new WebDriverWait(driver, 30);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xPath)));
	}

	/**
	 * Wait until element disappear from UI, timeout 30s
	 * 
	 * @param xPath
	 */
	public void waitForInvisibilityOfElement(String xPath) {
		getDriver();
		WebDriverWait wait = new WebDriverWait(driver, 30);
		wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(xPath)));
	}

	public boolean waitUntilElementVisible(String xPath, int timeoutInSeconds) {
		try {
			setImplicitTimeout(50, TimeUnit.MILLISECONDS);
			waitForVisibilityOfElement(xPath);
			resetImplicitTimeout();
			return true;
		} catch (Exception e) {
			resetImplicitTimeout();
			return false;
		}
	}

	/**
	 * Wait until element display on HTML, timeout 30s
	 * 
	 * @author hue
	 * @param xPath
	 */
	public void waitForPresenceOfElement(String xPath) {
		getDriver();
		WebDriverWait wait = new WebDriverWait(driver, 30);
		wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(xPath)));
	}

	/**
	 * @author hue Wait until element disappear from HTML, timeout 30s
	 * @param xPath
	 */
	public void waitForNotPresenceOfElement(String xPath) {
		getDriver();
		WebDriverWait wait = new WebDriverWait(driver, 30);
		wait.until(ExpectedConditions.not(ExpectedConditions.presenceOfAllElementsLocatedBy((By.xpath(xPath)))));
	}

	public void waitForClickabilityOfElement(String xPath) {
		getDriver();
		WebDriverWait wait = new WebDriverWait(driver, 30);
		wait.until(ExpectedConditions.elementToBeClickable(By.xpath(xPath)));
	}

	/**
	 * @author hue Wait until attribule of element to be a specific value,
	 *         timeout 30s
	 * @param xPath
	 */
	public void waitForAttributeToBe(String xPath, String attribute, String value) {
		getDriver();
		WebDriverWait wait = new WebDriverWait(driver, 30);
		wait.until(ExpectedConditions.attributeToBe(By.xpath(xPath), attribute, value));
	}

	/**
	 * =====================================BUTTON============================================================
	 */
	/**
	 * @author hue
	 * @param parentXpath
	 * @param btnName
	 * @param index
	 * @return
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
		return $(xPathBtn(parentXpath, btnName, index));
	}

	public WebElementFacade findBtn(String btnName, int index) {
		return findBtn("", btnName, index);
	}

	public WebElementFacade findBtn(String btnName) {
		return findBtn("", btnName, 1);
	}

	/**
	 * @author hue
	 * @param xPathParent
	 * @param btnName
	 * @param index
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

	public boolean isExistButton(String xPathParent, String label, int index) {
		return isElementExistNow(xPathBtn(xPathParent, label, index));
	}

	/**
	 * =====================================INPUT-FIELD============================================================
	 */
	/**
	 * @author hue
	 * @param parentXpath
	 * @param label
	 * @param index
	 * @return
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
		$(xPathInputWithLabel(parentXpath, label, index)).typeAndTab(value);
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
		String xPathValue = "//div[@id='ebx_ISS_pane' ]//div[text()='" + value
				+ "' and (contains(@id,'ebx_ISS_Item') or contains(@class,'ebx_ISS_Item')) ]";

		clickOnElement(xPathDDL);
		waitElementToBePresent(xPathValue).waitUntilClickable().click();
	}

	// TO-DO: need to rename method to inputDLLThentab
	public void enterDDLInput(String label, String value) {
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
		waitABit(1000);
		e.sendKeys(Keys.ENTER);
	}

	/**
	 * =====================================CHECK-BOX============================================================
	 */
	public String xPathCheckbox(String parentXpath, String label, int index) {
		String xPath = "(" + parentXpath + "//label[descendant-or-self::*[normalize-space(text())='" + label
				+ "' or normalize-space(.)='" + label + "' or @value='" + label
				+ "']][child::input[@type='checkbox']])[" + index + "]";
		return xPath;
	}

	public void checkCheckbox(String parentXpath, String label, int index) {
		waitElementToBePresent(xPathCheckbox(parentXpath, label, index)).waitUntilClickable().click();
	}

	public void checkCheckbox(String label) {
		checkCheckbox("", label, 1);
	}

	/**
	 * =====================================TABLE============================================================
	 */

	/**
	 * Get column index with column name in table default view
	 * 
	 * @author hue
	 * @param colName
	 * @return
	 */
	public int getColumnIndexWithLabel(String colName) {
		String xPathTable = "//div[@id='ebx_workspaceTable_headerContainer']";
		String xPathHeader = xPathTable + "//th[contains(@id,'ebx_workspaceTable_tableField')]";
		int colIndex = 0;
		int listCol = findBy(xPathTable).thenFindAll(xPathHeader).size();
		for (int i = 1; i <= listCol; i++) {
			String xPathColumn = "(" + xPathHeader + ")[" + i + "]//span[@class='ebx_RawLabel']";
			if (isElementExistNow(xPathColumn)) {
				System.out.println("colind=" + getText(xPathColumn));
				if (getText(xPathColumn).equals(colName)) {
					colIndex = i;
					break;
				}
			}
		}
		System.out.println("colind=" + colIndex);
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
				+ "]//td[not(*)]) | (//div[@id='ebx_workspaceTable_container']//tr[contains(@class,'ebx')][" + rowInd
				+ "]//td[child::div[not(*)]]))[" + colInd + "]";
		System.out.println("XPATH DATA CELL: " + xpathDataCell);
		return getTextValue(xpathDataCell);

	}

	/**
	 * =====================================POPUP/ALERT============================================================
	 */
	public void confirmPopupOK() {
		String xPath = "//div[@id='ebx_DialogBox']//button[text()='OK']|//div[@class='_ebx-pop-up']//button[contains(.,'OK')]";
		waitElementToBePresent(xPath).waitUntilClickable().click();
		waitForAllLoadingCompleted();
	}

	public void confirmPopupYES() {
		String xPath = "//div[@id='ebx_DialogBox']//button[text()='Yes']";
		waitElementToBePresent(xPath).waitUntilClickable().click();
	}

	/**
	 * =====================================OTHER============================================================
	 */

	public void getDiagram() {
		JavascriptExecutor jsExec = (JavascriptExecutor) driver;
		int x = 100;
		int y = 100;
		jsExec.executeScript("var e = document.getElementsByTagName('canvas');" + "e.click();");
		WebElement e = (WebElement) jsExec.executeScript("return document.getElementById('graphContainer');");
	}

	public WebElement getDiagramX() {
		return getElement("//div[@id='graphContainer']/canvas");
	}

	public static FirefoxProfile firefoxProfile() throws Exception {
		FirefoxProfile firefoxProfile = new FirefoxProfile();
		firefoxProfile.setPreference("browser.download.folderList", 2);
		firefoxProfile.setPreference("browser.download.manager.showWhenStarting", false);
		firefoxProfile.setPreference("browser.download.dir", System.getProperty("user.dir"));
		firefoxProfile.setPreference("browser.helperApps.neverAsk.saveToDisk",
				"text/csv,application/x-msexcel,application/excel,application/x-excel,application/vnd.ms-excel,image/png,image/jpeg,text/html,text/plain,application/msword,application/xml");

		return firefoxProfile;
	}

	public static void chromeProfile() {
		HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
		chromePrefs.put("download.default_directory", downloadFolder);
		ChromeOptions options = new ChromeOptions();
		options.setExperimentalOption("prefs", chromePrefs);

	}

	public void collapseAll() {
		String xPathExpandedBtn = xPathBtn("Expanded");
		int numOfExpandedBtn = findAllElement(xPathExpandedBtn).size();
		for (int i = numOfExpandedBtn; i >= 1; i--) {
			clickOnElement(findBtn("Expanded", i));
		}
	}

	public void expandItem(String item) {
		String xPathCollapsed = "//li[descendant-or-self::*[contains(text(),'" + item
				+ "')]]//button[@title='Collapsed']";
		if (isElementExistNow(xPathCollapsed)) {
			clickOnElement(xPathCollapsed);
		}
	}

	public void expandAllItem() {
		String xPathCollapsed = "//li//button[@title='Collapsed']";
		List<WebElementFacade> collapsedItems = findAllElement(xPathCollapsed);
		for (int i = 0; i < collapsedItems.size(); i++) {
			clickOnElement(collapsedItems.get(i));
			waitForAllLoadingCompleted();
		}

	}

	public <T> T executeJS(String command) {
		JavascriptExecutor jsExec = (JavascriptExecutor) driver;
		return (T) jsExec.executeScript(command);
	}

	public WebElementFacade scrollElementIntoView(String xPath) {
		WebElementFacade e = waitElementToBePresent(xPath);
		((JavascriptExecutor) getDriver()).executeScript("arguments[0].scrollIntoView(false);", e);
		waitABit(15);
		highlightElement(e);
		return e;
	}

	public WebElementFacade scrollElementIntoCenterView(String xPath) {
		WebElementFacade e = waitElementToBePresent(xPath);
		((JavascriptExecutor) getDriver()).executeScript("arguments[0].scrollIntoView(true);", e);
		waitABit(15);
		highlightElement(e);
		return e;
	}
}
