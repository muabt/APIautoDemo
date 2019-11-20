package com.orchestranetworks.auto.addon.pages.config;

import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.widget.config.MatchingProcessWidget;
import com.orchestranetworks.auto.addon.widget.config.MergingProcessWidget;
import com.orchestranetworks.auto.addon.widget.config.SourceWidget;
import com.orchestranetworks.auto.addon.widget.filter.AdvancedSearchImpl;
import com.orchestranetworks.auto.addon.widget.filter.SearchWidget;
import com.orchestranetworks.auto.addon.widget.general.FooterWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.DefaultViewImpl;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;
import org.openqa.selenium.WebDriver;

public class MatchingTablePage extends BasePage {

    private SearchWidget advanceSearch;
    private RecordDetailWidget recordDetailWidget;
    private ItemCreationWidget itemCreationWidget;
    private TableViewWidget defaultViewWidget;
    private FooterWidget footerWidget;
    private ToolbarWidget toolbarWidget;
    private MergingProcessWidget mergingProcessWidget;
    private MatchingProcessWidget matchingProcessWidget;
    private SourceWidget sourceWidget;

    public MatchingTablePage(WebDriver driver) {
        super(driver);
        this.advanceSearch = new AdvancedSearchImpl(this, null, 100);
        this.defaultViewWidget = new DefaultViewImpl(this, null, 100);
    }

    public SearchWidget getSearchWidget() {
        return advanceSearch;
    }

    public RecordDetailWidget getRecordDetailWidget() {
        return recordDetailWidget;
    }

    public ItemCreationWidget getItemCreationWidget() {
//        switchToLastIFrame();
        return itemCreationWidget;
    }

    public TableViewWidget getDefaultViewWidget() {
        return defaultViewWidget;
    }

    public FooterWidget getFooterWidget() {
        return footerWidget;
    }

    public ToolbarWidget getToolbarWidget() {
        return toolbarWidget;
    }

    public MergingProcessWidget getMergingProcessWidget() {
        return mergingProcessWidget;
    }

    public MatchingProcessWidget getMatchingProcessWidget() {
        return matchingProcessWidget;
    }

    public SourceWidget getSourceWidget(){
        return sourceWidget;
    }
}

