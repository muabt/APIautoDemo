package com.orchestranetworks.auto.addon.widget.merge;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class PreviewWidgetImpl extends BaseWidgetImpl implements PreviewWidget {
    public PreviewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private static final String XPATH_MERGE_BUTTON = "//button[@class='ebx_Button ebx_DefaultButton right' or @class='ebx_Button ebx_DefaultButton mergeBtn']";
    private static final String XPATH_NEXT_BUTTON = "//button[contains(text(),'Next')]";

    @Override
    public void clickBtnMerge() {

        waitForVisibilityOfElement(XPATH_MERGE_BUTTON);
        clickOnElement(XPATH_MERGE_BUTTON);
        waitForAllLoadingCompleted();
    }

    @Override
    public void clickBtnNext() {
        clickOnElement(XPATH_NEXT_BUTTON);
    }
}
