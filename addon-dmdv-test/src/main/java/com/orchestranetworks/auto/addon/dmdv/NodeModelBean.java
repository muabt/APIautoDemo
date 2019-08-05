/*
 * Copyright Orchestra Networks 2000-2012. All rights reserved.
 */
package com.orchestranetworks.auto.addon.dmdv;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public final class NodeModelBean {
	private boolean isGroup;
	private boolean visible;
	private boolean isExpanded;
	private String groupType;
	private String key;
	private String label;
	private String group;
	private String tooltipTextColor;
	private String tooltipBackground;
	private String nodeType;
	private String category;
	private boolean isExternal;
	private String background;
	private String textColor;
	private String borderColor;
	private String synchronization;
	private String hoverColor;

	public boolean getIsGroup() {
		return isGroup;
	}

	public void setIsGroup(boolean isGroup) {
		this.isGroup = isGroup;
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public boolean isExpanded() {
		return isExpanded;
	}

	public void setExpanded(boolean isExpanded) {
		this.isExpanded = isExpanded;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getTooltipTextColor() {
		return tooltipTextColor;
	}

	public void setTooltipTextColor(String tooltipTextColor) {
		this.tooltipTextColor = tooltipTextColor;
	}

	public String getTooltipBackground() {
		return tooltipBackground;
	}

	public void setTooltipBackground(String tooltipBackground) {
		this.tooltipBackground = tooltipBackground;
	}

	public String getNodeType() {
		return nodeType;
	}

	public void setNodeType(String nodeType) {
		this.nodeType = nodeType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public boolean isExternal() {
		return isExternal;
	}

	public void setExternal(boolean isExternal) {
		this.isExternal = isExternal;
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

	public String getSynchronization() {
		return synchronization;
	}

	public void setSynchronization(String synchronization) {
		this.synchronization = synchronization;
	}

	public String getHoverColor() {
		return hoverColor;
	}

	public void setHoverColor(String hoverColor) {
		this.hoverColor = hoverColor;
	}

}
