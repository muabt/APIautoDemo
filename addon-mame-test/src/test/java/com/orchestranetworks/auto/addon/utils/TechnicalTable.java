package com.orchestranetworks.auto.addon.utils;

public interface TechnicalTable {
    interface RecordMetadata {
        String ID = "id";
        String GROUP_ID = "groupId";
        String STATE = "state";
        String AUTO_CREATED = "autoCreated";
        String FUNCTIONAL_ID = "functionalId";
        String ISOLATED = "isolated";
    }

    interface MergeResult {
        String ID = "id";
        String RECORD_ID = "recordId";
        String GOLDEN_ID = "goldenId";
        String MERGING_PROCESS_ID = "mergingProcessId";
        String IS_INTERPOLATION = "isInterpolation";
    }

    interface MergingProcess {
        String ID = "id";
        String MERGE_POLICY_ID = "mergePolicyId";
        String MERGE_MODE = "mergeMode";
        String EXECUTION_DATE = "executionDate";
        String SNAPSHOT_ID = "snapshotId";
        String GROUP_ID = "groupId";
        String USER = "user";
        String IS_UNMERGED = "isUnmerged";
    }

    interface Decision {
        String ID = "id";
        String SOURCE_ID = "sourceId";
        String TARGET_ID = "targetId";
        String LAST_DECISION = "lastDecision";
        String USER = "user";
        String DECISION_DATE = "decisionDate";
        String MERGING_PROCESS_ID = "mergingProcessId";
    }

    interface MergeValueLineage {
        String ID = "id";
        String MERGING_PROCESS_ID = "mergingProcessId";
        String RECORD_ID = "recordId";
        String SOURCE_INDEX = "sourceIndex";
        String FIELD_PATH = "fieldPath";
        String GOLDEN_INDEX = "goldenIndex";
    }

    interface MameRecord {
        String FUNCTIONAL_ID = "FUNCTIONAL_ID";
        String TECHNICAL_ID = "TECHNICAL_ID";
        String STATE = "STATE";
        String GROUP_ID = "GROUP_ID";
        String MERGING_PROCESS_ID = "MERGING_PROCESS_ID";
    }

    interface MatchingResult {
        String ID = "id";
        String SOURCE_ID = "sourceId";
        String TARGET_ID = "targetId";
        String LAST_RESULT = "lastResult";
        String SESSION_ID = "sessionId";
    }

    interface MatchingSession {
        String ID = "id";
        String EXECUTION_DATE = "executionDate";
        String MATCHING_PROCESS_ID = "matchingProcessId";
        String MATCH_AGAINST = "matchAgainst";
        String MATCH_AGAINST_STATES = "matchAgainstStates";
        String PHASE = "phase";
    }
}
