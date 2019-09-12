package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class DataspaceBriefInfoWidgetImpl extends BaseWidgetImpl implements DataspaceBriefInfoWidget {
    public DataspaceBriefInfoWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }
}
