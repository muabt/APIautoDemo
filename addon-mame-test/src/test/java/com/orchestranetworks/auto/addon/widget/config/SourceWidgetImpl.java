package com.orchestranetworks.auto.addon.widget.config;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import com.orchestranetworks.auto.addon.utils.XFormat;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class SourceWidgetImpl extends BaseWidgetImpl implements SourceWidget {
    public SourceWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public SourceWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    public void selectCheckboxWithPK(String[] pks) {
        String xpath = "(//td[@class='ebx_tvSelectCell']//input[@type='checkbox'])[count(//div[@id='ebx_WorkspaceContent']//tr[(td[%s])";
        pks[0] = specialTextPredicates(pks[0]);
        if (pks.length >= 2) {
            for (int i = 1; i < pks.length; i++) {
                pks[i] = specialTextPredicates(pks[i]);
                xpath += " and (td[%s])";
            }
        }
        xpath += "]/preceding-sibling::*)+1]";
        xpath = XFormat.of(xpath, pks);
        clickByJS(xpath);
    }


}
