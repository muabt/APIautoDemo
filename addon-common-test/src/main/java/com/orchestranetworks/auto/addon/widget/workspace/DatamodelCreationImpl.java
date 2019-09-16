package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import net.serenitybdd.core.pages.PageObject;

public class DatamodelCreationImpl extends ItemCreationWidgetImpl {
	private static final String XPATH_NODE = "//td[descendant-or-self::text()='%s']";
	private static final String BTN_NODE_SERVICES = "Services";


	public DatamodelCreationImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public DatamodelCreationImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	public void clickBtnServiceNode(String nodeName) {
		clickBtn(XFormat.of(XPATH_NODE, nodeName), BTN_NODE_SERVICES);
	}

	public void selectKindOfElement(String kindOfElement) {
		selectRadioBoxWithLabel(kindOfElement);
		if (kindOfElement.equals("Group")) {
			checkCheckbox("Reuse an existing type");
		}
	}

	public void clickBtnPublish() {
		clickBtn("Publish");
	}
}
