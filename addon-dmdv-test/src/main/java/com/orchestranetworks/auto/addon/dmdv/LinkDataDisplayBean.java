package com.orchestranetworks.auto.addon.dmdv;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class LinkDataDisplayBean {
	private String strokeWidth;
	private String highlightColor;
	private String isRecursive;
	private String color;
	private String from;
	private String currentColor;
	private String text;
	private String to;
	private String key;
	private String multipleLinks;

	public String getStrokeWidth() {
		return strokeWidth;
	}

	public void setStrokeWidth(String strokeWidth) {
		this.strokeWidth = strokeWidth;
	}

	public String getHighlightColor() {
		return highlightColor;
	}

	public void setHighlightColor(String highlightColor) {
		this.highlightColor = highlightColor;
	}

	public String getIsRecursive() {
		return isRecursive;
	}

	public void setIsRecursive(String isRecursive) {
		this.isRecursive = isRecursive;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getCurrentColor() {
		return currentColor;
	}

	public void setCurrentColor(String currentColor) {
		this.currentColor = currentColor;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getMultipleLinks() {
		return multipleLinks;
	}

	public void setMultipleLinks(String multipleLinks) {
		this.multipleLinks = multipleLinks;
	}
	
}
