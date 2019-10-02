package com.orchestranetworks.auto.addon.widget.runmatch;

import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import org.junit.Assert;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class RunMatchWidgetImpl extends BaseWidgetImpl implements RunMatchWidget {

    private final static String MESSAGE_NO_MATCHING_IS_ACTIVED = "The run match service can't be executed: No matching process is actived. Please check your configuration.";
	
	private final static String MESSAGE_NO_DECISION_TREE_IS_CONFIGURED = "The decision tree has not been configured properly. Please check your configuration.";
    private final static String XPATH_MESSAGE = "//pop-up//p";
    private final static String XPATH_EXPAND_ADVANCE_SETTING = "//td/label[text()='Advanced settings']/ancestor::tr//button/span";
    public RunMatchWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }
    
    public void clickBtnRunMatch() {
    	clickBtn(MAMEConstants.RUN_MATCH);
    	waitAbit(1000);
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
    
    public void verifyMessageNoMatchingProcessIsActived() {
    	WebElementFacade element = getElement(XPATH_MESSAGE);
    	String actualMessage = element.getText().trim();
    	Assert.assertEquals(MESSAGE_NO_MATCHING_IS_ACTIVED, actualMessage);
    	
    }
    
    
    public void verifyMessageNoDecisionTreeIsConfigured() {
    	WebElementFacade element = getElement(XPATH_MESSAGE);
    	String actualMessage = element.getText().trim();
    	Assert.assertEquals(MESSAGE_NO_DECISION_TREE_IS_CONFIGURED, actualMessage);
    	
    }
    
    @Override
    public void expandMatchingProcessAdvancedSettings() {
    	getElement(XPATH_EXPAND_ADVANCE_SETTING).click();
    }
    
    
    
}