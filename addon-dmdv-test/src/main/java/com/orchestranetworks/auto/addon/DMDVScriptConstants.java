package com.orchestranetworks.auto.addon;

public final class DMDVScriptConstants {

	public static final String GET_GRAPH_COMPONENT = "return window.top.document.getElementById('ebx-legacy-component').angularComponentRef";

	public static final String GET_GO_DIAGRAM = GET_GRAPH_COMPONENT + ".getGoDiagram()";

	public static final String GET_ALL_LINKS = GET_GRAPH_COMPONENT + ".getAllLinks()";

	public static final String GET_NODE_DATA_BY_KEY = GET_GRAPH_COMPONENT + ".getNodeDataByKey('%s')";

	public static final String GET_NODE_DATA_BY_NAME = GET_GRAPH_COMPONENT + ".getNodeDataByName('%s')";

	public static final String CHECK_NODE_KEY_EXISTED = GET_GRAPH_COMPONENT + ".isNodeKeyExisted('%s')";

	public static final String GET_NUMBER_OF_NODES = GET_GRAPH_COMPONENT + ".getNumberOfNodes()";

	public static final String CHECK_GRAPH_INPROGRESS = GET_GRAPH_COMPONENT + ".isInProgress()";

	public static final String EXPAND_SOURCE_OF_NODE = GET_GRAPH_COMPONENT + ".expandSourceOfNode('%s', %s)";

	public static final String EXPAND_TARGET_OF_NODE = GET_GRAPH_COMPONENT + ".expandTargetOfNode('%s', %s)";

	public static final String EXPAND_CHILD_OF_NODE = GET_GRAPH_COMPONENT + ".expandChildOfNode('%s', %s)";

	public static final String EXPAND_PARENT_OF_NODE = GET_GRAPH_COMPONENT + ".expandParentOfNode('%s', %s)";

	public static final String COLLAPSE_SOURCE_OF_NODE = GET_GRAPH_COMPONENT + ".collapseSourceOfNode('%s')";

	public static final String COLLAPSE_TARGET_OF_NODE = GET_GRAPH_COMPONENT + ".collapseTargetOfNode('%s')";

	public static final String COLLAPSE_CHILD_OF_NODE = GET_GRAPH_COMPONENT + ".collapseChildOfNode('%s')";

	public static final String COLLAPSE_PARENT_OF_NODE = GET_GRAPH_COMPONENT + ".collapseParentOfNode('%s')";

	public static final String GET_GRAPH_ORIENTATION = GET_GRAPH_COMPONENT + ".getCurrentOrientation()";

	public static final String GET_LINK_DATA_BY_KEY = GET_GRAPH_COMPONENT + ".getLinkDataByKey('%s')";

	public static final String EXPAND_NODES_OF_INCREMENTAL_GRAPH = GET_GRAPH_COMPONENT + ".expandNode('%s')";

	public static final String COLLAPSE_NODES_OF_INCREMENTAL_GRAPH = GET_GRAPH_COMPONENT + ".collapseNode('%s')";

	public static final String GET_NODE_DATA_BY_KEY_OF_INCREMENTAL_GRAPH = GET_GRAPH_COMPONENT + ".getNodeDataByKey('%s')";
}
