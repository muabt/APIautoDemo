package com.orchestranetworks.auto.addon.widget.workspace;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class HierarchyViewWidgetImpl extends BaseWidgetImpl implements HierarchyViewWidget {

	public HierarchyViewWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}
}
