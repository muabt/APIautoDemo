/*
 * Copyright Orchestra Networks 2000-2012. All rights reserved.
 */
package com.orchestranetworks.auto.addon.dmdv;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public final class NodeDataDisplayBean
{
	private String key;
	private String text;
//	private boolean isGroup;
	private boolean hasTop;
	private boolean hasBottom;
	private boolean hasLeft;
	private boolean hasRight;
	private String topNodeText;
	private String bottomNodeText;
	private String leftNodeText;
	private String rightNodeText;
	private String style;
	private int orientation;
	private String parentTable;
	private String childTable;
	private String sourceTable;
	private String targetTable;
	private String collapseParentTable;
	private String collapseChildTable;
	private String collapseSourceTable;
	private String collapseTargetTable;
	private String background;
	private String textColor;
	private String borderColor;
	private String highlightColor;
	private String group;

	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
//	public boolean isGroup() {
//		return isGroup;
//	}
//	public void setGroup(boolean isGroup) {
//		this.isGroup = isGroup;
//	}
	public boolean isHasTop() {
		return hasTop;
	}
	public void setHasTop(boolean hasTop) {
		this.hasTop = hasTop;
	}
	public boolean isHasBottom() {
		return hasBottom;
	}
	public void setHasBottom(boolean hasBottom) {
		this.hasBottom = hasBottom;
	}
	public boolean isHasLeft() {
		return hasLeft;
	}
	public void setHasLeft(boolean hasLeft) {
		this.hasLeft = hasLeft;
	}
	public boolean isHasRight() {
		return hasRight;
	}
	public void setHasRight(boolean hasRight) {
		this.hasRight = hasRight;
	}
	public String getTopNodeText() {
		return topNodeText;
	}
	public void setTopNodeText(String topNodeText) {
		this.topNodeText = topNodeText;
	}
	public String getBottomNodeText() {
		return bottomNodeText;
	}
	public void setBottomNodeText(String bottomNodeText) {
		this.bottomNodeText = bottomNodeText;
	}
	public String getLeftNodeText() {
		return leftNodeText;
	}
	public void setLeftNodeText(String leftNodeText) {
		this.leftNodeText = leftNodeText;
	}
	public String getRightNodeText() {
		return rightNodeText;
	}
	public void setRightNodeText(String rightNodeText) {
		this.rightNodeText = rightNodeText;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public int getOrientation() {
		return orientation;
	}
	public void setOrientation(int orientation) {
		this.orientation = orientation;
	}
	public String getParentTable() {
		return parentTable;
	}
	public void setParentTable(String parentTable) {
		this.parentTable = parentTable;
	}
	public String getChildTable() {
		return childTable;
	}
	public void setChildTable(String childTable) {
		this.childTable = childTable;
	}
	public String getSourceTable() {
		return sourceTable;
	}
	public void setSourceTable(String sourceTable) {
		this.sourceTable = sourceTable;
	}
	public String getTargetTable() {
		return targetTable;
	}
	public void setTargetTable(String targetTable) {
		this.targetTable = targetTable;
	}
	public String getCollapseParentTable() {
		return collapseParentTable;
	}
	public void setCollapseParentTable(String collapseParentTable) {
		this.collapseParentTable = collapseParentTable;
	}
	public String getCollapseChildTable() {
		return collapseChildTable;
	}
	public void setCollapseChildTable(String collapseChildTable) {
		this.collapseChildTable = collapseChildTable;
	}
	public String getCollapseSourceTable() {
		return collapseSourceTable;
	}
	public void setCollapseSourceTable(String collapseSourceTable) {
		this.collapseSourceTable = collapseSourceTable;
	}
	public String getCollapseTargetTable() {
		return collapseTargetTable;
	}
	public void setCollapseTargetTable(String collapseTargetTable) {
		this.collapseTargetTable = collapseTargetTable;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getHighlightColor() {
		return highlightColor;
	}
	public void setHighlightColor(String highlightColor) {
		this.highlightColor = highlightColor;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
}
