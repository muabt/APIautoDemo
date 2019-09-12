package com.orchestranetworks.auto.addon.widget.general;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class ToolbarWidgetImpl extends BaseWidgetImpl implements ToolbarWidget {
    public ToolbarWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                             long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }
    
    public ToolbarWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }
	
	private static final String TOOLBAR_BTN = "//button[contains(@title,'%s')]";
    private static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";

    @Override
    public void clickBtnFilter() {
        clickBtn("Filters");
    }

    @Override
    public WebElementFacade getBtnView() {
        return findBy(xPathBtn("View)"));
    }

    @Override
    public WebElementFacade getBtnActions() {
        return findBy(xPathBtn("Actions"));
    }

    @Override
    public void selectService(String service) {
        clickBtn("Actions");

        String[] services = service.split(">");
        for (int i = 0; i < services.length; i++) {
            clickOnElement(XFormat.of(NAVIGATION_ITEM, services[i].trim()));
        }
        waitForAllLoadingCompleted();
        switchToFirstIFrame();
        waitAbit(2000);
    }

	@Override
	public void clickNextPage() {
		clickOnElement(XFormat.of(TOOLBAR_BTN, "next"));
	}
	    
	@Override
	public void clickPreviousPage() {
		clickOnElement(XFormat.of(TOOLBAR_BTN, "previous"));
	}
	
	@Override
	public void clickLastPage() {
		clickOnElement(XFormat.of(TOOLBAR_BTN, "last"));
	}

	@Override
	public void clickFirstPage() {
		clickOnElement(XFormat.of(TOOLBAR_BTN, "first"));
	}

	@Override
	public void selectDatasetService(String service) {
		switchOutDefaultIFrame();
		clickBtn(Constants.BTN_ACTIONS);		
		String[] services = service.split(">");
		for (int i = 0; i < services.length; i++) {
			clickOnElement("//span[text()='" + services[i].trim() + "']");
		}
	}
	
	@Override
	public void clickBtnCreateRecord() {
		waitForAllLoadingCompleted();
		switchToLastIFrame();
		clickBtn(Constants.BTN_CREATE_A_RECORD);

    }
	
    @Override
    public void clickBtnCreateDataspace() {
        clickBtn("Create a dataspace");
    }
}
