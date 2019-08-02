/*
 * Copyright Orchestra Networks 2000-2012. All rights reserved.
 */
package com.orchestranetworks.auto.addon.dmdv;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public final class LinkModelBean {
	private String from;
	private String to;
	private String label;
	private String fromText;
	private String toText;
	private String labelColor;
	private String color;
	private String hoverColor;
	private String tooltipBackgroundColor;
	private String tooltipTextColor;
	private String category;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getFromText() {
		return fromText;
	}

	public void setFromText(String fromText) {
		this.fromText = fromText;
	}

	public String getToText() {
		return toText;
	}

	public void setToText(String toText) {
		this.toText = toText;
	}

	public String getLabelColor() {
		return labelColor;
	}

	public void setLabelColor(String labelColor) {
		this.labelColor = labelColor;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getHoverColor() {
		return hoverColor;
	}

	public void setHoverColor(String hoverColor) {
		this.hoverColor = hoverColor;
	}

	public String getTooltipBackgroundColor() {
		return tooltipBackgroundColor;
	}

	public void setTooltipBackgroundColor(String tooltipBackgroundColor) {
		this.tooltipBackgroundColor = tooltipBackgroundColor;
	}

	public String getTooltipTextColor() {
		return tooltipTextColor;
	}

	public void setTooltipTextColor(String tooltipTextColor) {
		this.tooltipTextColor = tooltipTextColor;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "LinkModelBean [from=" + from + ", to=" + to + ", label=" + label + ", fromText=" + fromText
				+ ", toText=" + toText + ", labelColor=" + labelColor + ", color=" + color + ", hoverColor="
				+ hoverColor + ", tooltipBackgroundColor=" + tooltipBackgroundColor + ", tooltipTextColor="
				+ tooltipTextColor + ", category=" + category + "]";
	}

}
