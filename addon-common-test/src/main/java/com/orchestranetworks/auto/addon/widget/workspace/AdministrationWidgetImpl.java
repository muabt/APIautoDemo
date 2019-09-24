package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class AdministrationWidgetImpl extends BaseWidgetImpl implements AdministrationWidget{

	private static final String XPATH_SELECTOR_PANEL = "//div[@class='yui-panel-container shadow']";

	public AdministrationWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
			long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public AdministrationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void selectAnAdminFeature() {
		remove_div_on_administration_workspace();
		clickBtn(Constants.BTN_SELECT_ADMIN_FEATURE);
	}

	private void remove_div_on_administration_workspace() {
		switchToIFrame(Constants.IFRAME_LEGACY);
		boolean isPresent = findAllElements(XPATH_SELECTOR_PANEL).size() > 0;
		if (isPresent) {
			executeJS("arguments[0].style.visibility='hidden';",XPATH_SELECTOR_PANEL);
			executeJS("arguments[0].style.visibility='hidden';","//div[@id='ebx_SelectorPanel_mask']");
			waitForInvisibilityOfElement(XPATH_SELECTOR_PANEL);
		}
	}
}
