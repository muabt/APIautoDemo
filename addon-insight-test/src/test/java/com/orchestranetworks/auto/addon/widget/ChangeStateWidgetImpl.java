package com.orchestranetworks.auto.addon.widget;


import com.orchestranetworks.auto.addon.utils.Constants;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ChangeStateWidgetImpl extends BaseWidgetImpl implements ChangeStateWidget {


    private static final String XPATH_STATE_DES = "//div[@class='select-state-description']";
    private static final String XPATH_GOLDEN = "//option[@value='GOLDEN']";
    private static final String XPATH_BTN_LAUNCH_SERVCE = "//button[@class='ebx_Button ebx_TextAndIconRightButton ebx_DefaultButton btn-launch']";
    private static final String XPATH_UNSET = "//option[@value='UNSET']";
    //private static final String XPATH_METADATASET = "//li[@class='_ebx-tree_item']";



    public ChangeStateWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }


    @Override
    public String getStateDes() {
      //  waitAbit(5000);
        switchOutDefaultIFrame();
        switchToIFrame(Constants.IFRAME_LEGACY);
        switchToLastIFrame();
        return getTextValue(XPATH_STATE_DES).trim();
    }
    @Override
    public void selectTargetState() {
        switchOutDefaultIFrame();
        switchToIFrame(Constants.IFRAME_LEGACY);
        switchToLastIFrame();
        clickOnElement(XPATH_UNSET);
    }

    @Override
    public void selectGodelState() {
        switchOutDefaultIFrame();
        switchToIFrame(Constants.IFRAME_LEGACY);
        switchToLastIFrame();
        clickOnElement(XPATH_GOLDEN);

    }


    @Override
    public void clickBtnLaunchService()

    {
        clickOnElement(XPATH_BTN_LAUNCH_SERVCE);
    }




}