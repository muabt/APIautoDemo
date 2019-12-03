package com.orchestranetworks.auto.addon.widget.config;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class MergePolicyWidgetImpl extends BaseWidgetImpl implements MergePolicyWidget {

    public MergePolicyWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }


}
