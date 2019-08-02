package com.orchestranetworks.auto.addon;

public class Node {

	private final String key;
	private final String label;
	private final String backGround;
	private final String borderColor;
	private final String category;
	private final String group;
	private final String groupType;
	private final String hoverColor;
	private final boolean isGroup;
	private final boolean isVisible;
	private final boolean isExpanded;
	private final boolean isExternal;
	private final String nodeType;
	private final String textColor;
	// private Node parent;

	public Node(String key, String label, String backGround, String borderColor, String category, String group,
			String groupType, String hoverColor, boolean isGroup, boolean isVisible, boolean isExpanded,
			boolean isExternal, String nodeType, String textColor) {
		this.label = label;
		this.key = key;
		this.backGround = backGround;
		this.borderColor = borderColor;
		this.category = category;
		this.group = group;
		this.groupType = groupType;
		this.hoverColor = hoverColor;
		this.isGroup = isGroup;
		this.isVisible = isVisible;
		this.isExpanded = isExpanded;
		this.isExternal = isExternal;
		this.nodeType = nodeType;
		this.textColor = textColor;
	}

	public String getKey() {
		return this.key;

	}

	public String getName() {
		return this.label;
	}

	// public Node getParent() {
	// return parent;
	// }

	public String getBackGround() {
		return backGround;
	}

	public String getBorderColor() {
		return borderColor;
	}

	public String getCategory() {
		return category;
	}

	public String getGroup() {
		return group;
	}

	public boolean isGroup() {
		return isGroup;
	}

	public String getGroupType() {
		return groupType;
	}

	public String getHoverColor() {
		return hoverColor;
	}

	public boolean isVisible() {
		return isVisible;
	}

	public boolean isExpanded() {
		return isExpanded;
	}

	public boolean isExternal() {
		return isExternal;
	}

	public String getNodeType() {
		return nodeType;
	}

	public String getTextColor() {
		return textColor;
	}

}
