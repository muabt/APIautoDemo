package com.orchestranetworks.auto.addon.utils;

public interface TechnicalTable {
    public interface RecordMetadata {

        public final static String ID = "id";
        public final static String GROUP_ID = "groupId";
        public final static String STATE = "state";
        public final static String AUTO_CREATED = "autoCreated";
        public final static String FUNCTIONAL_ID = "functionalId";

    }

    public interface MergeResult {

        public final static String ID = "id";
        public final static String RECORD_ID = "recordId";
        public final static String GOLDEN_ID = "goldenId";
        public final static String MERGING_PROCESS_ID = "mergingProcessId";
        public final static String IS_INTERPOLATION = "isInterpolation";

    }

    public interface MergingProcess {

        public final static String ID = "id";
        public final static String MERGE_POLICY_ID = "mergePolicyId";
        public final static String MERGE_MODE = "mergeMode";
        public final static String EXECUTION_DATE = "executionDate";
        public final static String SNAPSHOT_ID = "snapshotId";
        public final static String GROUP_ID = "groupId";
        public final static String USER = "user";
        public final static String IS_UNMERGED = "isUnmerged";
    }
    public interface Decision {

        public final static String ID = "id";
        public final static String SOURCE_ID = "sourceId";
        public final static String TARGET_ID = "targetId";
        public final static String LAST_DECISION = "lastDecision";
        public final static String USER = "user";
        public final static String DECISION_DATE = "decisionDate";
        public final static String MERGING_PROCESS_ID = "mergingProcessId";
    }
    public interface MergeValueLineage{

        public final static String ID = "id";
        public final static String MERGING_PROCESS_ID = "mergingProcessId";
        public final static String RECORD_ID = "recordId";
        public final static String SOURCE_INDEX = "sourceIndex";
        public final static String FIELD_PATH = "fieldPath";
        public final static String GOLDEN_INDEX = "goldenIndex";
    }
}
