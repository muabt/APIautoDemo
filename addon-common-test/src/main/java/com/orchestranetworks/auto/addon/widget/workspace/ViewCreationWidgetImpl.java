package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.serenitybdd.core.pages.WebElementState;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.internal.Coordinates;
import org.openqa.selenium.support.pagefactory.ElementLocator;
import org.openqa.selenium.support.ui.Duration;
import org.openqa.selenium.support.ui.Wait;

import java.util.List;
import java.util.concurrent.TimeUnit;

public class ViewCreationWidgetImpl extends BaseWidgetImpl implements ViewCreationWidget {
	public ViewCreationWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
		super(page, locator, webElement, timeoutInMilliseconds);
	}

	public ViewCreationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
		super(page, locator, timeoutInMilliseconds);
	}

	@Override
	public void selectDisplayedColumn(String columnName) {

	}

	@Override
	public void selectDisplayableColumn(String columnName) {

	}

	@Override
	public void clickBtnMoveToTopDC() {

	}

	@Override
	public void clickBtnMoveUpDC() {

	}

	@Override
	public void clickBtnMoveDownDC() {

	}

	@Override
	public void clickBtnMoveToBottomDC() {

	}

	@Override
	public void clickBtnMoveLeftDC() {

	}

	@Override
	public void clickBtnMoveRightDC() {

	}

	@Override
	public void clickBtnMoveAllLeftDC() {

	}

	@Override
	public void clickBtnMoveAllRightDC() {

	}

	@Override
	public void selectDMOrdering(boolean check) {

	}

	@Override
	public void selectSortedColumn(String columnName) {

	}

	@Override
	public void selectSortableColumn(String columnName) {

	}

	@Override
	public void clickBtnMoveToTopSC() {

	}

	@Override
	public void clickBtnMoveUpSC() {

	}

	@Override
	public void clickBtnMoveDownSC() {

	}

	@Override
	public void clickBtnMoveToBottomSC() {

	}

	@Override
	public void clickBtnMoveLeftSC() {

	}

	@Override
	public void clickBtnMoveRightSC() {

	}

	@Override
	public void clickBtnMoveAllLeftSC() {

	}

	@Override
	public void clickBtnMoveAllRightSC() {

	}

	@Override
	public void selectFilterCondition(String filter) {

	}

	@Override
	public void selectAddCriterion(String criteriion) {

	}

	@Override
	public void clickAddLogicalBlock() {

	}

	@Override
	public void clickRemoveAllCriteria() {

	}

	@Override
	public void selectPaginationLimit(String limit) {

	}

	@Override
	public void selectGridEdit(boolean enabled) {

	}

	@Override
	public void selectToolBarOnTableTop(String toolbarName) {

	}

	@Override
	public void selectToolBarOnTableRow(String toolbarName) {

	}
}
