package com.orchestranetworks.auto.addon.widget;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.pages.ChangeStatePage;
import com.orchestranetworks.auto.addon.utils.Constants;
import net.thucydides.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class ChangeStateWidgetImpl extends BaseWidgetImpl implements ChangeStateWidget {

    public ChangeStateWidgetImpl(PageObject page, ElementLocator locator, long timeoutMilliseconds) {
        super(page, locator, timeoutMilliseconds);
    }
    private static  final String XPATH_STATE_DES ="//div[contains (text(),'Please select the target state value')]";
    private static  final String XPATH_GOLDEN =  "//select[@class='display-box']//option[2]";


    @Override
    public String getStateDes() {
        switchToIFrame(Constants.IFRAME_SERVICE);
        return getText(XPATH_STATE_DES);
    }
    @Override
    public void selectTargetState(String state) {
        clickByJS(XPATH_GOLDEN);

    }
    @Override
    public void clickBtnLaunchService() {
        clickOnElement(XPATH_STATE_DES);
    }



}