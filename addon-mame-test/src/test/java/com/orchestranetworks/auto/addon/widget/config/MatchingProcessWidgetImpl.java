package com.orchestranetworks.auto.addon.widget.config;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;


public class MatchingProcessWidgetImpl extends BaseWidgetImpl implements MatchingProcessWidget {

	public MatchingProcessWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void selectRadioBoxWithLabel(String label, String value) {

    }

    @Override
    public void selectDDLByJS(String label, String value) {

    }
}
