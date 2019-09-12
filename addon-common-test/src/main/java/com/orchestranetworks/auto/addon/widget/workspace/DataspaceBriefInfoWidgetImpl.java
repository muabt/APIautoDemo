package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class DataspaceBriefInfoWidgetImpl extends BaseWidgetImpl implements DataspaceBriefInfoWidget {
    public DataspaceBriefInfoWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public String getTextIdentifier() {
        return getTextWithLabel("Identifier");
    }

    @Override
    public String getTextType() {
        return getTextWithLabel("Type");
    }

    @Override
    public String getTextOwner() {
        return getTextWithLabel("Owner");
    }

    @Override
    public String getTextStatus() {
        return getTextWithLabel("Status");
    }

    @Override
    public String getTextLoadingStrategy() {
        return getTextWithLabel("Loading strategy");
    }

    @Override
    public String getTextChildMergePolicy() {
        return getTextWithLabel("Child merge policy");
    }
}
