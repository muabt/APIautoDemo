package com.orchestranetworks.auto.addon.widget.config;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;


public class MatchingProcessWidgetImpl extends BaseWidgetImpl implements MatchingProcessWidget {

    public MatchingProcessWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }


    @Override
    public String getValueOfRadioField(String fieldName) {
        String xPath = "//tr[descendant::label[.='" + fieldName + "']]//input[@type='radio'][@checked='checked']";
        String value = getElement(xPath).getAttribute("value");
        if (value.equals("true")) {
            return "Yes";
        } else {
            return "No";
        }
    }

    @Override
    public String getValueOfInputField(String fieldName) {
        String xpathField = "//tr[descendant::label[.='" + fieldName + "']]//input[@type='text']";
        return getElement(xpathField).getAttribute("value");
    }

    @Override
    public String getValueOfDropdownField(String fieldName) {
        String xpathField = "//tr[descendant::label[.='" + fieldName + "']]//input[@type='text']";
        return getElement(xpathField).getAttribute("value");
    }
}
