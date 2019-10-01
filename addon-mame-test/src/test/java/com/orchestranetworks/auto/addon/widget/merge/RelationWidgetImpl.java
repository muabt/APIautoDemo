package com.orchestranetworks.auto.addon.widget.merge;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class RelationWidgetImpl extends BaseWidgetImpl implements RelationWidget {
    public RelationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }
}
