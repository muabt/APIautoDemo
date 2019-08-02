#Author: tbui@tibco.com
@DMDV100-GraphModel
Feature: Test graph data with configuration
 
  Background: 
    Given I login to EBX succesfully

  Scenario: GenM_59 - Check Generated successfully with model Include Field, Groups, Table + PK + No FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-01"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | tableLayer2 | GroupA |
      | GroupA      |        |
      | GroupB      |        |
      | Table B1    |        |
    Then the graph model should contains following fields
      | f2:Date and time      |             |
      | id:Integer            | TableA      |
      | id1:String            | TableA      |
      | namea1:String         | TableA      |
      | fieldlayer2:String    |             |
      | grouplayer2234:String |             |
      | id:Integer            | Table B1    |
      | nameb:String          | Table B1    |
      | nameb2:String         | Table B1    |
      | idlayer3:Integer      | tableLayer2 |
    Then the graph model should contains following links
      | TableA      | Table B1    | fkab  |  | 0..1 |
      | tableLayer2 | tableLayer2 | fktob |  | 0..1 |

 Scenario: GenM_60 - Check Generated successfully with model Include Field, Groups, Table + PKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-02"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA_DMP-02 |               |
      | tableLayer2   | GroupB_DMP-02 |
      | GroupB_DMP-02 |               |
      | GroupB_DMP-02 |               |
      | GroupLayer2   | GroupB_DMP-02 |
    Then the graph model should contains following fields
      | f2_dmp-02:Date and time  |               |
      | id:Integer               | TableA_DMP-02 |
      | id1:String               | TableA_DMP-02 |
      | id2:Decimal              | TableA_DMP-02 |
      | id3:Time                 | TableA_DMP-02 |
      | id4:Integer              | TableA_DMP-02 |
      | fieldlayer2:String       |               |
      | idlayer3:Integer         | tableLayer2   |
      | id1layer3:String         | tableLayer2   |
      | id2layer3:Integer        | tableLayer2   |
      | fieldlayer3:HTML content |               |
    Then there is no link displayed
    
  Scenario: GenM_61 - Check Generated successfully with model Include Field, Groups, Table + PKs,FKs
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-03"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableAB     |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:Integer         | TableAB     |
      | fkab:TableA        | TableAB     |
      | fkba:TableB        | TableAB     |
      | idlayer3:Integer   | tableLayer2 |
    Then the graph model should contains following links
      | TableA  | TableB | fka  |  | 0..1 |
      | TableAB | TableA | fkab |  |    1 |
      | TableAB | TableB | fkba |  |    1 |
      
 Scenario: GenM_62 - Check Generated successfully with model Include Fields, Groups, Tables + Has FK + Same data model + same Table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-04"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableAB     |        |
      | TableC      |        |
      | TableD      |        |
      | TableE      |        |
      | tableLayer2 | GroupA |
      | GB          | GroupB |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | name:String        | TableA      |
      | address:String     | TableA      |
      | id:Integer         | TableB      |
      | name:String        | TableB      |
      | phone:String       | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idab:Integer       | TableAB     |
      | name:String        | TableAB     |
      | idc:String         | TableC      |
      | name:String        | TableC      |
      | add:Address        | TableC      |
      | idd:String         | TableD      |
      | name:String        | TableD      |
      | ide:String         | TableE      |
      | name:String        | TableE      |
      | idlayer3:Integer   | tableLayer2 |
      | name:String        | tableLayer2 |
      | id:Integer         | GB          |
      | name:String        | GB          |
      | street:String      | TableC      |
      | city:String        | TableC      |
      | country:String     | TableC      |
    Then the graph model should contains following links
      | TableA      | TableA      | fka      |  | 0..1 |
      | TableA      | TableB      | fkb      |  | 0..1 |
      | TableB      | TableC      | fkb      |  | 0..1 |
      | TableC      | TableD      | fkd      |  | 0..1 |
      | tableLayer2 | tableLayer2 | fklayer2 |  | 0..1 |

Scenario: GenM_63 - Check Generated successfully with model Include Fields, Groups, Tables + Has FK + Same data model + Other Table
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-05"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | LinkTable   |        |
      | tableLayer2 | GroupA |
      | TableB      |        |
      | TableA      |        |
      | TableC      |        |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:Integer         | LinkTable   |
      | idlayer3:Integer   | tableLayer2 |
      | id:Integer         | TableB      |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | assolink:TableC    | TableA      |
      | id:Integer         | TableC      |
    Then the graph model should contains following links
      | TableA    | TableB | fka   |  | 0..1 |
      | TableA    | TableB | fk12  |  | 0..1 |
      | LinkTable | TableA | fk15a |  | 0..1 |
      | LinkTable | TableC | fk15c |  | 0..1 |
      
 Scenario: GenM_64 - Check Generated successfully with model Include Fields, Groups, Tables + Has FK + other data model (External data model)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-06"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idlayer3:Integer   | tableLayer2 |
    Then there is no link displayed
      
Scenario: GenM_65 - Check Generated successfully with model Include Fields, Groups, Tables + Has FK + other DataSpace (External data model)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-07"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA               |        |
      | TableB               |        |
      | GroupA               |        |
      | GroupB               |        |
      | tableLayer2          | GroupA |
      | Indicator definition |        |
      | TableA               |        |
    Then the graph model should contains following fields
      | f1:String                                         |                      |
      | f2:Date and time                                  |                      |
      | id:Integer                                        | TableA               |
      | id1:String                                        | TableA               |
      | id:Integer                                        | TableB               |
      | fieldlayer2:String                                |                      |
      | grouplayer2:String                                |                      |
      | idlayer3:Integer                                  | tableLayer2          |
      | code:String                                       | Indicator definition |
      | label and description:localizableLabelDescription | Indicator definition |
      | input parameters:bespokeInputParams               | Indicator definition |
      | output parameters:bespokeOutputParams             | Indicator definition |
      | big data definition                               | Indicator definition |
      | flat result definition                            | Indicator definition |
      | has many outcomes:Boolean                         | Indicator definition |
      | id:Integer                                        | TableA               |
      | id1:String                                        | TableA               |
      | localizeddocumentations                           | Indicator definition |
      | default value(s):String                           | Indicator definition |
      | default value(s):String                           | Indicator definition |
      | big data path:String                              | Indicator definition |
      | flat result path:String                           | Indicator definition |
      | locale:Locale                                     | Indicator definition |
      | label:String                                      | Indicator definition |
      | description:Text                                  | Indicator definition |
    Then the graph model should contains following links
      | TableA | Indicator definition | fkotherdataset |  | 0..1 |
      | TableB | TableA               | fk             |  | 0..1 |

 Scenario: GenM_65.1 - Check Generated successfully with model Include external table (Same TableName, Same Data Model SameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_174"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA |  |
    Then the graph model should contains following fields
      | id:String | TableA |
    Then the graph model should contains following links
      | TableA | TableA | aa |  | 0..n |

  Scenario: GenM_65.2 - Check Generated successfully with model Include external table (#TabelName&Same Data Model, SameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_175"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA |  |
      | TableB |  |
      | TableC |  |
      | TableD |  |
      | TableE |  |
    Then the graph model should contains following fields
      | id:String | TableA |
      | id:String | TableB |
      | id:String | TableC |
      | id:String | TableD |
      | id:String | TableE |
    Then the graph model should contains following links
      | TableA | TableB | ab |  | 0..1 |
      | TableA | TableC | ac |  | 0..1 |
      | TableA | TableD | ad |  | 0..1 |
      | TableA | TableE | ae |  | 0..1 |

  Scenario: GenM_65.3 - Check Generated successfully with model Include external table (SameTabelName &#DataModel&sameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_176"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA |  |
      | TableA |  |
    Then the graph model should contains following fields
      | id:String | TableA |
      | id:String | TableA |
    Then the graph model should contains following links
      | TableA | TableA | fkto_176.1 |  | 0..n |

  Scenario: GenM_65.4 - Check Generated successfully with model Include external table (#TabelName&#DataModel&sameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_177"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA |  |
      | TableB |  |
    Then the graph model should contains following fields
      | id:String | TableA |
      | id:String | TableB |
    Then the graph model should contains following links
      | TableA | TableB | fkto_b_177.1 |  | 0..1 |
 
  Scenario: GenM_65.5_65.6_65.9 - Check Generated successfully with model Include external table (#TabelName&#DataModel&#Space, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.2.0"
    Given I access dataset "V120_US07_externalTable"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA_101               |        |
      | TableA_102               |        |
      | TableA_103               |        |
      | GroupA                   |        |
      | TableA_104               | GroupA |
      | TableA_109               | GroupA |
      | TableA_114               | GroupA |
      | TableA_116               | GroupA |
      | TableA_120               | GroupA |
      | TableA_123               | GroupA |
      | TableA_127               | GroupA |
      | TableA_SameModel#dataset | GroupA |
      | TableB_102               |        |
      | TableB_103               |        |
      | TableA                   |        |
      | TableB                   |        |
      | TableC                   |        |
      | TableA                   |        |
      | TableB                   |        |
      | TableC                   |        |
      | TableB                   |        |
      | TableA                   |        |
      | TableB                   |        |
      | TableA                   |        |
    Then the graph model should contains following fields
      | id:Integer                  | TableA_101               |
      | name:String                 | TableA_101               |
      | assa_b101:TableB            | TableA_101               |
      | id:Integer                  | TableA_102               |
      | name:String                 | TableA_102               |
      | groupc1                     | TableA_102               |
      | id:Integer                  | TableA_103               |
      | name:String                 | TableA_103               |
      | groupc1                     | TableA_103               |
      | grouplevel2                 | TableA_102               |
      | grouplevel2                 | TableA_103               |
      | grouplevel2.1               | TableA_103               |
      | id:String                   | TableA_104               |
      | namea:String                | TableA_104               |
      | id:String                   | TableA_109               |
      | namea:String                | TableA_109               |
      | id:String                   | TableA_114               |
      | namea:String                | TableA_114               |
      | id:String                   | TableA_116               |
      | namea:String                | TableA_116               |
      | id:String                   | TableA_120               |
      | namea:String                | TableA_120               |
      | id:String                   | TableA_123               |
      | namea:String                | TableA_123               |
      | fkto127.1:TableA            | TableA_127               |
      | id:String                   | TableA_SameModel#dataset |
      | namea:String                | TableA_SameModel#dataset |
      | grouplevel3:Grouplevel3Type | TableA_102               |
      | id:String                   | TableB_102               |
      | nameb:String                | TableB_102               |
      | grouplevel4                 | TableA_102               |
      | id:String                   | TableB_103               |
      | nameb:String                | TableB_103               |
      | groupb_103                  | TableB_103               |
      | id:Integer                  | TableA                   |
      | namea:String                | TableA                   |
      | id:Integer                  | TableB                   |
      | nameb:String                | TableB                   |
      | id:Integer                  | TableC                   |
      | namec:String                | TableC                   |
      | id:Integer                  | TableA                   |
      | namea:String                | TableA                   |
      | id:Integer                  | TableB                   |
      | nameb:String                | TableB                   |
      | id:Integer                  | TableC                   |
      | namec:String                | TableC                   |
      | id:String                   | TableB                   |
      | id:Integer                  | TableA                   |
      | namea:String                | TableA                   |
      | pkfk_d123.1:TableD          | TableB                   |
      | pkfk_a123:TableA_123        | TableB                   |
      | id:Integer                  | TableA                   |
      | namea:String                | TableA                   |
      | groupblevel2_103            | TableB_103               |
    Then the graph model should contains following links
      | TableA_102               | TableB_102               | fka_b102               |  | 0..1 |
      | TableA_103               | TableB_103               | fka_b103               |  | 0..1 |
      | TableA_109               | TableA                   | fka_a109               |  | 0..n |
      | TableA_109               | TableB                   | fka_b109               |  | 0..n |
      | TableA_109               | TableC                   | fka_c109               |  | 0..n |
      | TableA_114               | TableA                   | fka_a114               |  | 0..n |
      | TableA_114               | TableB                   | fka_b114               |  | 0..n |
      | TableA_114               | TableC                   | fka_c114               |  | 0..n |
      | TableA_116               | TableB                   | fka_b116               |  | 0..1 |
      | TableA_120               | TableA                   | fka_b120child          |  | 0..1 |
      | TableA_123               | TableB                   | fka_b123child          |  | 0..1 |
      | TableA_127               | TableA                   | fkto127.1              |  |    1 |
      | TableA_127               | TableA                   | fkto127.2              |  |    1 |
      | TableA_127               | TableA                   | fkto127.3              |  |    1 |
      | TableA_SameModel#dataset | TableA_SameModel#dataset | fka_a_samemodeldataset |  | 0..1 |
      | TableA_102               | TableB_102               | fk2a_b102              |  | 0..1 |
      | TableA_103               | TableB_103               | fk2a_b103              |  | 0..1 |
      | TableA_103               | TableB_103               | fk3a_b103              |  | 0..1 |
      | TableA_102               | TableB_102               | fk3a_b102              |  | 0..1 |
      | TableA_102               | TableB_102               | fk4a_b102              |  | 0..1 |
   
  Scenario: GenM_65.7 - Check Generated successfully with model Include external table (#TabelName&#DataModel&#Space, that have (n)#DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_180"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA |  |
      | TableB |  |
    Then the graph model should contains following fields
      | pkfk180.1.1:TableB | TableA |
      | pkfk180.1.2:TableB | TableA |
      | pkfk180.1.3:TableB | TableA |
      | id:String          | TableB |
      | name:String        | TableB |
    Then the graph model should contains following links
      | TableA | TableB | pkfk180.1.1 |  | 1 |
      | TableA | TableB | pkfk180.1.2 |  | 1 |
      | TableA | TableB | pkfk180.1.3 |  | 1 |
      
 Scenario: GenM_65.8 - Check Generated successfully with model Include external table (#TabelName&(n)#DataModel&sameSpace, (n)#DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_181"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA |  |
      | TableB |  |
      | TableC |  |
    Then the graph model should contains following fields
      | id:String   | TableA |
      | id:String   | TableB |
      | name:String | TableB |
      | id:String   | TableC |
    Then the graph model should contains following links
      | TableA | TableB | fka-b181.1 |  | 0..1 |
      | TableA | TableC | fka-c181.2 |  | 0..1 |   
 
  Scenario: US06-11.1 - Check Generated successfully with model Include external table (Same TableName, Same Data Model SameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_174"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |

    Then the graph model should contains following fields

      | id1:String         | TableA      |
    Then the graph model should contains following links
      | TableA      | Table A    | fkaa  |  | 0..n |

  Scenario: GenM_66 - Check Generated successfully with model Include Fields, Groups, Tables + Has FKs incomming
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-08"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idlayer3:Integer   | tableLayer2 |
   Then there is no link displayed
    
  Scenario: GenM_67 - Check Generated successfully with model Include Fields, Groups, Tables + Has FKs outgoing
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-09"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
      | TableB      |        |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idlayer3:Integer   | tableLayer2 |
      | id:Integer         | TableB      |
    Then the graph model should contains following links
      | TableA | TableB | fkoutgoing |  | 0..1 |
      
Scenario: GenM_68 - Check Generated successfully with model Include Fields, Groups, Tables + Has FKs incomming + Has FKs outgoing
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-10"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableC      |        |
      | tableLayer2 | GroupA |
      | TableB      |        |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:String          | TableC      |
      | idlayer3:Integer   | tableLayer2 |
      | id:Integer         | TableB      |
    Then the graph model should contains following links
      | TableA | TableB | fkoutgoing |  | 0..1 |
      | TableB | TableC | fkc        |  |    1 |
      
  Scenario: GenM_69 - Check Generated successfully with model Include Fields, Groups, Tables + Has Association as FK + Same data model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-11"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | association:TableA | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idlayer3:Integer   | tableLayer2 |
    Then the graph model should contains following links
      |TableA |TableA |fk | |0..1 |
      
 Scenario: GenM_70 - Check Generated successfully with model Include Fields, Groups, Tables + Has Association as FK + other data model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-12"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idlayer3:Integer   | tableLayer2 |
    Then the graph model should contains following links
      | TableA | TableA | fk |  | 0..1 |
      
  Scenario: GenM_71 - Check Generated successfully with model Include Fields, Groups, Tables + Has Association as FK + other DataSpace
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-13"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String                 |             |
      | f2:Date and time          |             |
      | id:Integer                | TableA      |
      | id1:String                | TableA      |
      | associationmuafree:Table8 | TableA      |
      | id:Integer                | TableB      |
      | fieldlayer2:String        |             |
      | grouplayer2:String        |             |
      | idlayer3:Integer          | tableLayer2 |
    Then the graph model should contains following links
      | TableA | TableA | fk |  | 0..1 |
      
Scenario: GenM_72 - Check Generated successfully with model Include Fields, Groups, Tables + Has Association as Over a link table + Same data model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-14"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableC      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | ass:TableC         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:Integer         | TableC      |
      | idlayer3:Integer   | tableLayer2 |
    Then the graph model should contains following links
      | TableA | TableA | fk   |  | 0..1 |
      | TableB | TableA | fkba |  | 0..1 |
      | TableB | TableC | fkbc |  | 0..1 |
      
 Scenario: GenM_73 - Check Generated successfully with model Include Fields, Groups, Tables + Has Association as Over a link table + other data model
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-15"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableC      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | assolink:TableC    | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:Integer         | TableC      |
      | idlayer3:Integer   | tableLayer2 |
    Then the graph model should contains following links
      | TableA | TableA | fk |  | 0..1 |
      
  Scenario: GenM_74 - Check Generated successfully with model Include Fields, Groups, Tables + Has Association as Over a link table + other DataSpace
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-17"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableC      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String            |             |
      | f2:Date and time     |             |
      | id:Integer           | TableA      |
      | id1:String           | TableA      |
      | asolinkkspace:TableC | TableA      |
      | id:Integer           | TableB      |
      | fieldlayer2:String   |             |
      | grouplayer2:String   |             |
      | id:Integer           | TableC      |
      | idlayer3:Integer     | tableLayer2 |
    Then the graph model should contains following links
      | TableA | TableA | fk |  | 0..1 |
      
 Scenario: GenM_75 - Check Generated successfully with model Include Fields, Groups, Tables + Reused Simple data types by manual created
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-20"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableC      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | simple:Text        | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:Integer         | TableC      |
      | idlayer3:Integer   | tableLayer2 |
    Then the graph model should contains following links
      | TableA | TableA | fk |  | 0..1 |
      
Scenario: GenM_76 - Check Generated successfully with model include Fields, Groups, Tables + Reused Complex data types by manual created
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-22"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableC      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | reuse1:Complex1    | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:Integer         | TableC      |
      | address:String     | TableA      |
      | postcode:Integer   | TableA      |
      | idlayer3:Integer   | tableLayer2 |
    Then the graph model should contains following links
      | TableA | TableA | fk |  | 0..1 |
      
Scenario: GenM_77_78 - Check Generated successfully with model Include Fields, Groups, Tables + many layer between them + Has Inherited field
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-24"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | Table1                                                                                                                                                                                                                            |        |
      | Table3                                                                                                                                                                                                                            |        |
      | Group1                                                                                                                                                                                                                            |        |
      | Group2                                                                                                                                                                                                                            |        |
      | Table4                                                                                                                                                                                                                            |        |
      | Table5                                                                                                                                                                                                                            |        |
      | Table6                                                                                                                                                                                                                            |        |
      | Table7                                                                                                                                                                                                                            |        |
      | Table8                                                                                                                                                                                                                            |        |
      | Table9                                                                                                                                                                                                                            |        |
      | Table10                                                                                                                                                                                                                           |        |
      | Table11                                                                                                                                                                                                                           |        |
      | Table12                                                                                                                                                                                                                           |        |
      | Table13                                                                                                                                                                                                                           |        |
      | Table14                                                                                                                                                                                                                           |        |
      | Table15                                                                                                                                                                                                                           |        |
      | Table16                                                                                                                                                                                                                           |        |
      | Table17                                                                                                                                                                                                                           |        |
      | Table18                                                                                                                                                                                                                           |        |
      | Table19                                                                                                                                                                                                                           |        |
      | Table20                                                                                                                                                                                                                           |        |
      | Table21                                                                                                                                                                                                                           |        |
      | Table22                                                                                                                                                                                                                           |        |
      | Table23                                                                                                                                                                                                                           |        |
      | Table24                                                                                                                                                                                                                           |        |
      | Table25                                                                                                                                                                                                                           |        |
      | Table26                                                                                                                                                                                                                           |        |
      | Table27                                                                                                                                                                                                                           |        |
      | Table28                                                                                                                                                                                                                           |        |
      | Table29                                                                                                                                                                                                                           |        |
      | Table30                                                                                                                                                                                                                           |        |
      | Group3                                                                                                                                                                                                                            |        |
      | Table31                                                                                                                                                                                                                           |        |
      | Table32                                                                                                                                                                                                                           |        |
      | Table33                                                                                                                                                                                                                           |        |
      | Group4                                                                                                                                                                                                                            |        |
      | Bank                                                                                                                                                                                                                              |        |
      | Images                                                                                                                                                                                                                            |        |
      | Category                                                                                                                                                                                                                          |        |
      | ReuseTable                                                                                                                                                                                                                        |        |
      | Location                                                                                                                                                                                                                          |        |
      | TableABCDEFGHIJKLMNOPQONVNGHDFUSIDDJKDHkshdjswwewqdsadsafdasfaefe                                                                                                                                                                 |        |
      | Nhungkhuchatbendongsongquanho.tacgiachuaduocbietten.oridontknowthis                                                                                                                                                               |        |
      | Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargesewss |        |
      | &lt;body&gt;&lt;/body&gt;                                                                                                                                                                                                         |        |
      | Tableg1                                                                                                                                                                                                                           | Group2 |
      | Tableg2                                                                                                                                                                                                                           | Group2 |
      | Tableg3                                                                                                                                                                                                                           | Group2 |
      | TableGroup                                                                                                                                                                                                                        | Group3 |
      | TableGroup2                                                                                                                                                                                                                       | Group3 |
      | GL2                                                                                                                                                                                                                               | Group4 |
      | GL3                                                                                                                                                                                                                               | GL2    |
      | GL4                                                                                                                                                                                                                               | GL3    |
      | GL5                                                                                                                                                                                                                               | GL4    |
      | Tablecon                                                                                                                                                                                                                          | GL4    |
      | GL6                                                                                                                                                                                                                               | GL5    |
      | GL7                                                                                                                                                                                                                               | GL6    |
      | GL8                                                                                                                                                                                                                               | GL7    |
      | GL9                                                                                                                                                                                                                               | GL8    |
      | GL10                                                                                                                                                                                                                              | GL9    |
      | Name Table                                                                                                                                                                                                                        | GL10   |
    Then the graph model should contains following fields
      | name:String                                                                                                                                                                                                                              | Table1                                                                                                                                                                                                                            |
      | address:String                                                                                                                                                                                                                           | Table1                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table1                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table3                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Table3                                                                                                                                                                                                                            |
      | api809                                                                                                                                                                                                                                   | Table3                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Group1                                                                                                                                                                                                                            |
      | address:String                                                                                                                                                                                                                           | Group1                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Group1                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table4                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Table4                                                                                                                                                                                                                            |
      | address:Groupcommon                                                                                                                                                                                                                      | Table4                                                                                                                                                                                                                            |
      | m811                                                                                                                                                                                                                                     | Table4                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table5                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Table5                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table6                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Table6                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table7                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Table7                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table8                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Table8                                                                                                                                                                                                                            |
      | api                                                                                                                                                                                                                                      | Table8                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table9                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Table9                                                                                                                                                                                                                            |
      | association1:Table8                                                                                                                                                                                                                      | Table9                                                                                                                                                                                                                            |
      | association2:Table1                                                                                                                                                                                                                      | Table9                                                                                                                                                                                                                            |
      | api813                                                                                                                                                                                                                                   | Table9                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Table10                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table10                                                                                                                                                                                                                           |
      | api818                                                                                                                                                                                                                                   | Table10                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table11                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table11                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table12                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table12                                                                                                                                                                                                                           |
      | api817                                                                                                                                                                                                                                   | Table12                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table13                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table13                                                                                                                                                                                                                           |
      | overview                                                                                                                                                                                                                                 | Table13                                                                                                                                                                                                                           |
      | governance detail                                                                                                                                                                                                                        | Table13                                                                                                                                                                                                                           |
      | attestations:Table1                                                                                                                                                                                                                      | Table13                                                                                                                                                                                                                           |
      | documents:Table11                                                                                                                                                                                                                        | Table13                                                                                                                                                                                                                           |
      | data elements                                                                                                                                                                                                                            | Table13                                                                                                                                                                                                                           |
      | other links:Table12                                                                                                                                                                                                                      | Table13                                                                                                                                                                                                                           |
      | audit                                                                                                                                                                                                                                    | Table13                                                                                                                                                                                                                           |
      | a813                                                                                                                                                                                                                                     | Table13                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table14                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table14                                                                                                                                                                                                                           |
      | api818                                                                                                                                                                                                                                   | Table14                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Table15                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table15                                                                                                                                                                                                                           |
      | api817                                                                                                                                                                                                                                   | Table15                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table16                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table16                                                                                                                                                                                                                           |
      | api818                                                                                                                                                                                                                                   | Table16                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table17                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table17                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Table18                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table18                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table19                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table19                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table20                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table20                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table21                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table21                                                                                                                                                                                                                           |
      | identifier:Integer                                                                                                                                                                                                                       | Table22                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table22                                                                                                                                                                                                                           |
      | identifier:String                                                                                                                                                                                                                        | Table23                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table23                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table24                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table24                                                                                                                                                                                                                           |
      | profile:String                                                                                                                                                                                                                           | Table24                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Table25                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table25                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Table26                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table26                                                                                                                                                                                                                           |
      | product:String                                                                                                                                                                                                                           | Table26                                                                                                                                                                                                                           |
      | identifier:String                                                                                                                                                                                                                        | Table27                                                                                                                                                                                                                           |
      | name:Text                                                                                                                                                                                                                                | Table27                                                                                                                                                                                                                           |
      | identifier:String                                                                                                                                                                                                                        | Table28                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table28                                                                                                                                                                                                                           |
      | company:String                                                                                                                                                                                                                           | Table28                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Table29                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table29                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Table30                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table30                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              |                                                                                                                                                                                                                                   |
      | identifier:Integer                                                                                                                                                                                                                       | Table31                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table31                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Table32                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table32                                                                                                                                                                                                                           |
      | tgroup1                                                                                                                                                                                                                                  | Table32                                                                                                                                                                                                                           |
      | tgroup2                                                                                                                                                                                                                                  | Table32                                                                                                                                                                                                                           |
      | tgroup3                                                                                                                                                                                                                                  | Table32                                                                                                                                                                                                                           |
      | defaultprice:String                                                                                                                                                                                                                      | Table32                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Table33                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table33                                                                                                                                                                                                                           |
      | price:String                                                                                                                                                                                                                             | Table33                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Bank                                                                                                                                                                                                                              |
      | name:String                                                                                                                                                                                                                              | Bank                                                                                                                                                                                                                              |
      | id:String                                                                                                                                                                                                                                | Images                                                                                                                                                                                                                            |
      | name:String                                                                                                                                                                                                                              | Images                                                                                                                                                                                                                            |
      | id:Integer                                                                                                                                                                                                                               | Category                                                                                                                                                                                                                          |
      | name:String                                                                                                                                                                                                                              | Category                                                                                                                                                                                                                          |
      | api                                                                                                                                                                                                                                      | Category                                                                                                                                                                                                                          |
      | id:String                                                                                                                                                                                                                                | ReuseTable                                                                                                                                                                                                                        |
      | name:String                                                                                                                                                                                                                              | ReuseTable                                                                                                                                                                                                                        |
      | id:String                                                                                                                                                                                                                                | Location                                                                                                                                                                                                                          |
      | name:String                                                                                                                                                                                                                              | Location                                                                                                                                                                                                                          |
      | id:String                                                                                                                                                                                                                                | TableABCDEFGHIJKLMNOPQONVNGHDFUSIDDJKDHkshdjswwewqdsadsafdasfaefe                                                                                                                                                                 |
      | id:String                                                                                                                                                                                                                                | Nhungkhuchatbendongsongquanho.tacgiachuaduocbietten.oridontknowthis                                                                                                                                                               |
      | id:String                                                                                                                                                                                                                                | Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargesewss |
      | marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.marginbetweentoolbarbuttonandvalidationlabelistoolargesewss:String | Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargesewss |
      | id:String                                                                                                                                                                                                                                | &lt;body&gt;&lt;/body&gt;                                                                                                                                                                                                         |
      | id:String                                                                                                                                                                                                                                | Tableg1                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Tableg1                                                                                                                                                                                                                           |
      | id:Integer                                                                                                                                                                                                                               | Tableg2                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Tableg2                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Tableg3                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Tableg3                                                                                                                                                                                                                           |
      | street:String                                                                                                                                                                                                                            | Table4                                                                                                                                                                                                                            |
      | base string:String                                                                                                                                                                                                                       | Table13                                                                                                                                                                                                                           |
      | base text:Text                                                                                                                                                                                                                           | Table13                                                                                                                                                                                                                           |
      | localization                                                                                                                                                                                                                             | Table13                                                                                                                                                                                                                           |
      | tier:Integer                                                                                                                                                                                                                             | Table13                                                                                                                                                                                                                           |
      | type of report:String                                                                                                                                                                                                                    | Table13                                                                                                                                                                                                                           |
      | contacts & owners                                                                                                                                                                                                                        | Table13                                                                                                                                                                                                                           |
      | regulatory                                                                                                                                                                                                                               | Table13                                                                                                                                                                                                                           |
      | citi                                                                                                                                                                                                                                     | Table13                                                                                                                                                                                                                           |
      | eucs:Table4                                                                                                                                                                                                                              | Table13                                                                                                                                                                                                                           |
      | information consumption:Table9                                                                                                                                                                                                           | Table13                                                                                                                                                                                                                           |
      | associate data elements:String                                                                                                                                                                                                           | Table13                                                                                                                                                                                                                           |
      | created by:String                                                                                                                                                                                                                        | Table13                                                                                                                                                                                                                           |
      | created:Date and time                                                                                                                                                                                                                    | Table13                                                                                                                                                                                                                           |
      | last updated by:String                                                                                                                                                                                                                   | Table13                                                                                                                                                                                                                           |
      | last updated:String                                                                                                                                                                                                                      | Table13                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | TableGroup                                                                                                                                                                                                                        |
      | name:String                                                                                                                                                                                                                              | TableGroup                                                                                                                                                                                                                        |
      | id:String                                                                                                                                                                                                                                | TableGroup2                                                                                                                                                                                                                       |
      | id:String                                                                                                                                                                                                                                | Table32                                                                                                                                                                                                                           |
      | name:String                                                                                                                                                                                                                              | Table32                                                                                                                                                                                                                           |
      | localization                                                                                                                                                                                                                             | Table32                                                                                                                                                                                                                           |
      | tier:Integer                                                                                                                                                                                                                             | Table32                                                                                                                                                                                                                           |
      | type of report:String                                                                                                                                                                                                                    | Table32                                                                                                                                                                                                                           |
      | is this a bcbs key report?:Boolean                                                                                                                                                                                                       | Table32                                                                                                                                                                                                                           |
      | contacts & owners                                                                                                                                                                                                                        | Table32                                                                                                                                                                                                                           |
      | regulatory                                                                                                                                                                                                                               | Table32                                                                                                                                                                                                                           |
      | citi                                                                                                                                                                                                                                     | Table32                                                                                                                                                                                                                           |
      | report impact:String                                                                                                                                                                                                                     | Table32                                                                                                                                                                                                                           |
      | report due date:Date and time                                                                                                                                                                                                            | Table32                                                                                                                                                                                                                           |
      | send email reminder:String                                                                                                                                                                                                               | Table32                                                                                                                                                                                                                           |
      | frequency of submission:String                                                                                                                                                                                                           | Table32                                                                                                                                                                                                                           |
      | production method:Text                                                                                                                                                                                                                   | Table32                                                                                                                                                                                                                           |
      | delivery method:String                                                                                                                                                                                                                   | Table32                                                                                                                                                                                                                           |
      | language:String                                                                                                                                                                                                                          | Table13                                                                                                                                                                                                                           |
      | localized name:String                                                                                                                                                                                                                    | Table13                                                                                                                                                                                                                           |
      | administrative contact:String                                                                                                                                                                                                            | Table13                                                                                                                                                                                                                           |
      | authorized signatory:String                                                                                                                                                                                                              | Table13                                                                                                                                                                                                                           |
      | primary owner:String                                                                                                                                                                                                                     | Table13                                                                                                                                                                                                                           |
      | base string:String                                                                                                                                                                                                                       | Table13                                                                                                                                                                                                                           |
      | base string:String                                                                                                                                                                                                                       | Table13                                                                                                                                                                                                                           |
      | domicile country:String                                                                                                                                                                                                                  | Table13                                                                                                                                                                                                                           |
      | report impact:String                                                                                                                                                                                                                     | Table13                                                                                                                                                                                                                           |
      | report due date:Date and time                                                                                                                                                                                                            | Table13                                                                                                                                                                                                                           |
      | production method:Text                                                                                                                                                                                                                   | Table13                                                                                                                                                                                                                           |
      | delivery method:String                                                                                                                                                                                                                   | Table13                                                                                                                                                                                                                           |
      | language:String                                                                                                                                                                                                                          | Table32                                                                                                                                                                                                                           |
      | localizedname:String                                                                                                                                                                                                                     | Table32                                                                                                                                                                                                                           |
      | base text:Text                                                                                                                                                                                                                           | Table32                                                                                                                                                                                                                           |
      | administrative contact:String                                                                                                                                                                                                            | Table32                                                                                                                                                                                                                           |
      | authorized signatory:String                                                                                                                                                                                                              | Table32                                                                                                                                                                                                                           |
      | primary owner:String                                                                                                                                                                                                                     | Table32                                                                                                                                                                                                                           |
      | region:String                                                                                                                                                                                                                            | Table32                                                                                                                                                                                                                           |
      | country:String                                                                                                                                                                                                                           | Table32                                                                                                                                                                                                                           |
      | domicile country:String                                                                                                                                                                                                                  | Table32                                                                                                                                                                                                                           |
      | regulatory agency:String                                                                                                                                                                                                                 | Table32                                                                                                                                                                                                                           |
      | cbna identifier:Boolean                                                                                                                                                                                                                  | Table32                                                                                                                                                                                                                           |
      | legal entity:String                                                                                                                                                                                                                      | Table32                                                                                                                                                                                                                           |
      | id:String                                                                                                                                                                                                                                | Tablecon                                                                                                                                                                                                                          |
      | id:String                                                                                                                                                                                                                                | Name Table                                                                                                                                                                                                                        |
    Then the graph model should contains following links
      | Table1                                                                                                                                                                                                                            | Table3     | fk3           |  | 0..n |
      | Table1                                                                                                                                                                                                                            | Table4     | fk4           |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table5     | fk5           |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table6     | fk6           |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table7     | fk7           |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table8     | fk8           |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table9     | fk9           |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table10    | fk10          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table11    | fk11          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table12    | fk12          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table13    | fk13          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table14    | fk14          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table15    | fk15          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table16    | fk16          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table17    | fk17          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table18    | fk18          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table19    | fk19          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table20    | fk20          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table21    | fk21          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table22    | fk22          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table1     | fk1-1         |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table23    | fk23          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table24    | fk24          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table25    | fk25          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table26    | fk26          |  | 0..1 |
      | Table1                                                                                                                                                                                                                            | Table30    | fk30          |  | 0..1 |
      | Table3                                                                                                                                                                                                                            | Table21    | fk321         |  | 0..1 |
      | Table3                                                                                                                                                                                                                            | Table4     | fk34          |  | 0..1 |
      | Table3                                                                                                                                                                                                                            | Table1     | fk31          |  | 0..1 |
      | Table3                                                                                                                                                                                                                            | Table5     | fk35          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table3     | fk3           |  | 0..n |
      | Group1                                                                                                                                                                                                                            | Table4     | fk4           |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table5     | fk5           |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table6     | fk6           |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table7     | fk7           |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table8     | fk8           |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table9     | fk9           |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table10    | fk10          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table11    | fk11          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table12    | fk12          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table13    | fk13          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table14    | fk14          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table15    | fk15          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table16    | fk16          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table17    | fk17          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table18    | fk18          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table19    | fk19          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table20    | fk20          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table21    | fk21          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table22    | fk22          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table1     | fk1-1         |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table23    | fk23          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table24    | fk24          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table25    | fk25          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table26    | fk26          |  | 0..1 |
      | Group1                                                                                                                                                                                                                            | Table30    | fk30          |  | 0..1 |
      | Table4                                                                                                                                                                                                                            | Table1     | fk41          |  | 0..1 |
      | Table4                                                                                                                                                                                                                            | Table5     | fk4-5         |  | 0..1 |
      | Table4                                                                                                                                                                                                                            | Table3     | fk4-3         |  | 0..1 |
      | Table4                                                                                                                                                                                                                            | Table6     | fk46          |  | 0..1 |
      | Table5                                                                                                                                                                                                                            | Table1     | fk51          |  | 0..1 |
      | Table5                                                                                                                                                                                                                            | Table4     | fk5-4         |  | 0..1 |
      | Table5                                                                                                                                                                                                                            | Table6     | fk5-6         |  | 0..1 |
      | Table5                                                                                                                                                                                                                            | Table5     | fk55          |  | 0..1 |
      | Table6                                                                                                                                                                                                                            | Table1     | fk61          |  | 0..1 |
      | Table6                                                                                                                                                                                                                            | Table5     | fk6-5         |  | 0..1 |
      | Table6                                                                                                                                                                                                                            | Table7     | fk6-7         |  | 0..1 |
      | Table7                                                                                                                                                                                                                            | Table1     | fk71          |  | 0..1 |
      | Table8                                                                                                                                                                                                                            | Table10    | fk810         |  | 0..1 |
      | Table8                                                                                                                                                                                                                            | Table9     | fk89          |  | 0..1 |
      | Table8                                                                                                                                                                                                                            | Table1     | fk81          |  | 0..1 |
      | Table9                                                                                                                                                                                                                            | Table10    | fk910_1       |  | 0..n |
      | Table9                                                                                                                                                                                                                            | Table9     | fk99          |  | 0..1 |
      | Table9                                                                                                                                                                                                                            | Table11    | fk911         |  | 0..1 |
      | Table9                                                                                                                                                                                                                            | Table12    | fk912         |  | 0..1 |
      | Table9                                                                                                                                                                                                                            | Table1     | fk91          |  | 0..1 |
      | Table9                                                                                                                                                                                                                            | Table8     | fk98          |  |    1 |
      | Table10                                                                                                                                                                                                                           | Table10    | fk1010        |  | 0..1 |
      | Table10                                                                                                                                                                                                                           | Table14    | fk1014        |  | 0..1 |
      | Table10                                                                                                                                                                                                                           | Table11    | fk1011        |  | 0..1 |
      | Table10                                                                                                                                                                                                                           | Table1     | fk101         |  | 0..1 |
      | Table10                                                                                                                                                                                                                           | Table12    | fk1012        |  | 0..1 |
      | Table10                                                                                                                                                                                                                           | Table8     | fk108         |  | 0..1 |
      | Table11                                                                                                                                                                                                                           | Table12    | fk1112        |  | 0..1 |
      | Table11                                                                                                                                                                                                                           | Table9     | fk119         |  | 0..1 |
      | Table11                                                                                                                                                                                                                           | Table13    | fk1113        |  | 0..1 |
      | Table11                                                                                                                                                                                                                           | Table1     | fk11-1        |  | 0..1 |
      | Table11                                                                                                                                                                                                                           | Table10    | fk1110        |  | 0..1 |
      | Table11                                                                                                                                                                                                                           | Table8     | fk118         |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table9     | f129          |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table12    | fk912         |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table13    | fk1213        |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table11    | fk1211        |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table14    | fk1214        |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table1     | fk12-1        |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table10    | fk1210        |  | 0..1 |
      | Table12                                                                                                                                                                                                                           | Table8     | fk128         |  | 0..1 |
      | Table13                                                                                                                                                                                                                           | Table15    | fk1315        |  | 0..1 |
      | Table13                                                                                                                                                                                                                           | Table1     | fk131         |  | 0..1 |
      | Table13                                                                                                                                                                                                                           | Table14    | fk1314        |  | 0..1 |
      | Table13                                                                                                                                                                                                                           | Table12    | fk1312        |  | 0..1 |
      | Table13                                                                                                                                                                                                                           | Table9     | fk139         |  | 0..1 |
      | Table13                                                                                                                                                                                                                           | Table8     | fk138         |  | 0..1 |
      | Table14                                                                                                                                                                                                                           | Table12    | fk1412        |  | 0..1 |
      | Table14                                                                                                                                                                                                                           | Table15    | fk1415        |  | 0..1 |
      | Table14                                                                                                                                                                                                                           | Table1     | fk141         |  | 0..1 |
      | Table14                                                                                                                                                                                                                           | Table8     | fk148         |  | 0..1 |
      | Table15                                                                                                                                                                                                                           | Table1     | fk151         |  | 0..1 |
      | Table15                                                                                                                                                                                                                           | Table14    | fk1514        |  | 0..1 |
      | Table16                                                                                                                                                                                                                           | Table1     | fk161         |  | 0..1 |
      | Table16                                                                                                                                                                                                                           | Table15    | fk1615        |  | 0..1 |
      | Table17                                                                                                                                                                                                                           | Table1     | fk171         |  | 0..1 |
      | Table17                                                                                                                                                                                                                           | Table16    | fk1716        |  | 0..1 |
      | Table18                                                                                                                                                                                                                           | Table1     | fk181         |  | 0..1 |
      | Table19                                                                                                                                                                                                                           | Table1     | fk191         |  | 0..1 |
      | Table20                                                                                                                                                                                                                           | Table1     | fk20-1        |  | 0..1 |
      | Table21                                                                                                                                                                                                                           | Table1     | fk21-1        |  | 0..1 |
      | Table21                                                                                                                                                                                                                           | Table20    | fk21-20       |  | 0..1 |
      | Table22                                                                                                                                                                                                                           | Table1     | fk22          |  | 0..1 |
      | Table23                                                                                                                                                                                                                           | Table24    | fk2324        |  | 0..1 |
      | Table25                                                                                                                                                                                                                           | Table26    | fk2526        |  | 0..1 |
      | Table26                                                                                                                                                                                                                           | Table25    | fk2625        |  | 0..1 |
      | Table26                                                                                                                                                                                                                           | Table24    | fk2624        |  | 0..1 |
      | Table27                                                                                                                                                                                                                           | Table28    | fk2728        |  | 0..1 |
      | Table27                                                                                                                                                                                                                           | Table28    | fk2728-2      |  | 0..1 |
      | Table27                                                                                                                                                                                                                           | Table25    | fk2725        |  | 0..1 |
      | Table27                                                                                                                                                                                                                           | Table26    | fk2726        |  | 0..1 |
      | Table27                                                                                                                                                                                                                           | Table24    | fk2724        |  | 0..1 |
      | Table28                                                                                                                                                                                                                           | Table27    | fk2827        |  | 0..1 |
      | Table29                                                                                                                                                                                                                           | Table24    | fk2924        |  | 0..n |
      | Table32                                                                                                                                                                                                                           | Table1     | fk32-1        |  | 0..1 |
      | Table33                                                                                                                                                                                                                           | Table32    | fk33-32       |  | 0..1 |
      | Bank                                                                                                                                                                                                                              | Location   | location      |  | 0..1 |
      | Bank                                                                                                                                                                                                                              | Images     | image         |  | 0..1 |
      | Category                                                                                                                                                                                                                          | Bank       | bank          |  | 0..1 |
      | ReuseTable                                                                                                                                                                                                                        | ReuseTable | fk            |  | 0..1 |
      | Location                                                                                                                                                                                                                          | ReuseTable | fk            |  | 0..1 |
      | TableABCDEFGHIJKLMNOPQONVNGHDFUSIDDJKDHkshdjswwewqdsadsafdasfaefe                                                                                                                                                                 | Table21    | fk            |  | 0..1 |
      | Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargewhenthenavigationpaneissmall.Marginbetweentoolbarbuttonandvalidationlabelistoolargesewss | Bank       | fkbank        |  | 0..1 |
      | Tableg1                                                                                                                                                                                                                           | Group1     | fk            |  | 0..1 |
      | Tableg2                                                                                                                                                                                                                           | Group1     | fk            |  | 0..1 |
      | Tableg3                                                                                                                                                                                                                           | Group1     | fk            |  | 0..1 |
      | Table13                                                                                                                                                                                                                           | Table13    | report parent |  | 0..1 |
      | TableGroup                                                                                                                                                                                                                        | Table31    | fkg31         |  | 0..1 |
      | TableGroup                                                                                                                                                                                                                        | Tableg3    | fkg2          |  | 0..1 |
      | TableGroup2                                                                                                                                                                                                                       | TableGroup | tableg        |  | 0..1 |
      | Table32                                                                                                                                                                                                                           | Table32    | reportparent  |  | 0..1 |
  
Scenario: GenM_79 - Check Generated successfully with model Include Fields, Groups, Table + Number of value (Min, Max)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-30"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idlayer3:Integer   | tableLayer2 |
    Then there is no link displayed    
    
  Scenario: GenM_80 - Check Generated successfully with model Include Fields, Groups, Table + Label and description too long
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-31"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA                                                                                                                                                                                                                                                                                  |        |
      | TableB                                                                                                                                                                                                                                                                                  |        |
      | GroupA                                                                                                                                                                                                                                                                                  |        |
      | GroupB                                                                                                                                                                                                                                                                                  |        |
      | Model include Fields, Groups, Table + Label and description + MutilLanguage (blank, invalid, valid) + Model include Fields, Groups, Tables + Reused Complex data types by manual created + Model include Fields, Groups, Tables + Has Association as By XPath predicate + other DataSet |        |
      | tableLayer2                                                                                                                                                                                                                                                                             | GroupA |
    Then the graph model should contains following fields
      | f1:String          |                                                                                                                                                                                                                                                                                         |
      | f2:Date and time   |                                                                                                                                                                                                                                                                                         |
      | id:Integer         | TableA                                                                                                                                                                                                                                                                                  |
      | id1:String         | TableA                                                                                                                                                                                                                                                                                  |
      | id:Integer         | TableB                                                                                                                                                                                                                                                                                  |
      | fieldlayer2:String |                                                                                                                                                                                                                                                                                         |
      | grouplayer2:String |                                                                                                                                                                                                                                                                                         |
      | id:Integer         | Model include Fields, Groups, Table + Label and description + MutilLanguage (blank, invalid, valid) + Model include Fields, Groups, Tables + Reused Complex data types by manual created + Model include Fields, Groups, Tables + Has Association as By XPath predicate + other DataSet |
      | idlayer3:Integer   | tableLayer2                                                                                                                                                                                                                                                                             |
    Then there is no link displayed
    
Scenario: GenM_81 - Check Generated successfully with model Include Fields, Groups, Table + Label and description + MutilLanguage
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-32"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | TableC      |        |
      | !@%$%^&*()  |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | !@#$%&*(&^:String  |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | id:String          | TableC      |
      | id:String          | !@%$%^&*()  |
      | idlayer3:Integer   | tableLayer2 |
    Then there is no link displayed
    
  Scenario: GenM_82 - Check Generated successfully with model Include Fields, Groups, Table + Default view and tools (Hidden)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "DMP-34"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
      | TableA      |        |
      | TableB      |        |
      | GroupA      |        |
      | GroupB      |        |
      | tableLayer2 | GroupA |
    Then the graph model should contains following fields
      | f1:String          |             |
      | f2:Date and time   |             |
      | id:Integer         | TableA      |
      | id1:String         | TableA      |
      | id:Integer         | TableB      |
      | fieldlayer2:String |             |
      | grouplayer2:String |             |
      | idlayer3:Integer   | tableLayer2 |
    Then there is no link displayed
    