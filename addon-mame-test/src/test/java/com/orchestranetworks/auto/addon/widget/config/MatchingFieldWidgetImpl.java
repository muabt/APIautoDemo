package com.orchestranetworks.auto.addon.widget.config;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;


public class MatchingFieldWidgetImpl extends BaseWidgetImpl implements MatchingFieldWidget {

	public MatchingFieldWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }
	
	@Override
    public void selectDDLByJS(String label, String value) {
        String xPathDDL = "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='"
                + label + "']]//button[@title='Open drop-down list']";

        String xPathValue = "//div[@id='ebx_ISS_pane' ]//div[(" + specialTextPredicates(value)
                + " and string-length(normalize-space(text())=" + value.length()
                + ")) and (contains(@id,'ebx_ISS_Item') or contains(@class,'ebx_ISS_Item'))]";
        clickOnElement(xPathDDL);

        executeJS("arguments[0].click();", xPathValue);
    }
	
}
