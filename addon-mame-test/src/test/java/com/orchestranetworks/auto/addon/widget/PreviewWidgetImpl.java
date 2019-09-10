package com.orchestranetworks.auto.addon.widget;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class PreviewWidgetImpl extends BaseWidgetImpl implements PreviewWidget {
    public PreviewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void clickBtnMerge() {
        String xPath = "//button[@class='ebx_Button ebx_DefaultButton mergeBtn']";
        clickOnElement(xPath);
    }
}
