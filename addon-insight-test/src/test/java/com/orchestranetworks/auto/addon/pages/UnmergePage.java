package com.orchestranetworks.auto.addon.pages;


import com.orchestranetworks.auto.addon.widget.general.PopupWidget;
import org.openqa.selenium.WebDriver;

public class UnmergePage extends BasePage {
    private PopupWidget popupWidget;
    public UnmergePage(WebDriver driver) { super(driver); }

    public PopupWidget getPopupWidget() {
        return popupWidget;
    }
}
