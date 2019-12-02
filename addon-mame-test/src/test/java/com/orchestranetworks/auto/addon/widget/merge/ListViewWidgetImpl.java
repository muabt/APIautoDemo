package com.orchestranetworks.auto.addon.widget.merge;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class ListViewWidgetImpl extends BaseWidgetImpl implements ListViewWidget {
    public ListViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void selectRelationValue(String fieldLabel, String value) {
        int index = findAllElements("//tr[contains(.,'" + value + "')]/preceding-sibling::*").size() + 1;
        String xPath = "(//relation-record[contains(.,'" + fieldLabel + "')]//record-view-pane//input[@type='checkbox'])[" + index + "]";
        if (!getElement(xPath+"/parent::td").getAttribute("class").contains("SelectedRow")){
            clickOnElement(xPath);
        }

    }
}
