package com.orchestranetworks.auto.addon.widget;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class RunMatchWidgetImpl extends BaseWidgetImpl implements RunMatchWidget {
	
    public RunMatchWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }
    
    public void clickBtnRunMatch() {
    	clickBtn("Run match");
    }
    
    

    @Override
    public void selectRecordToMatchAgainst(String label, String matchAgainst) {
    	selectDDLByJS(label, matchAgainst);
    }
    
    
    private void selectDDLByJS(String label, String value) {
        String xPathDDL = "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[contains(text(),'"
                + label + "')]]//button[@class='ebx_MenuButton ebx_FlatButton']";
        getElement(xPathDDL).click();
        String xPathValue = "//div[@class='ebx_ISS_Item' ]/div[.='" + value + "']";
        executeJS("arguments[0].click();", xPathValue);
    }
}