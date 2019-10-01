package com.orchestranetworks.auto.addon.widget.config;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.pages.BasePage;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class MergingProcessWidgetImpl extends BaseWidgetImpl implements MergingProcessWidget {

    public MergingProcessWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }


}
