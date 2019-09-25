package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.filter.AdvancedSearchImpl;
import com.orchestranetworks.auto.addon.widget.filter.SearchWidget;
import org.openqa.selenium.WebDriver;

public class MatchingTablePage  extends BasePage {

    private SearchWidget advanceSearch;

    public MatchingTablePage(WebDriver driver) {
        super(driver);
        this.advanceSearch = new AdvancedSearchImpl(this,null,100);
    }

    public SearchWidget getSearchWidget() {
        return advanceSearch;
    }


}

