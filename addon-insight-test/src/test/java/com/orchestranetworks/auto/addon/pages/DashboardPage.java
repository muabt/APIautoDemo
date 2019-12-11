package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.DashboardWidget;
import com.orchestranetworks.auto.addon.widget.general.PopupWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import org.openqa.selenium.WebDriver;

public class DashboardPage extends BasePage {
    private DashboardWidget dashboardWidget;
    private ItemCreationWidget itemCreationWidget;
    private PopupWidget popupWidget;

    public DashboardPage(WebDriver driver) {
        super(driver);
    }
    public DashboardWidget getDashboardWidget() {
        return dashboardWidget;
    }
    public ItemCreationWidget getItemCreationWidget() {
        return itemCreationWidget;
    }

}

