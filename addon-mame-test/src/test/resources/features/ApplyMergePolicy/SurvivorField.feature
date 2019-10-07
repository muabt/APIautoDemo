@SYSTEM
Feature: Merge function for survivor field
  I want to use this template for Merge function for survivor field

  Scenario: SC-MPMM80 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Longest and the sources of survivor field are different lenght
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 38"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | Date           | Name      | Company |
      | 04/01/2019     | {H} Danny | LG      |
      | 06/01/2019     | Sall      | MS      |
      | 06/06/2019     | Lan       | FPT     |
      | {H} 06/23/2019 | Fry       | {H} PO  |
    And preview table is displayed as below
      | Date       | Name  | Company |
      | 06/23/2019 | Danny | PO      |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM81 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Longest the sources of survivor field are same lenght
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 37"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name      | Phone      | National |
      | 1          | Lovly     | 13,456     | 3        |
      | 2          | Kylie     | 312,456    | 3        |
      | 3          | Jenny     | 21,345     | 3        |
      | {H} 4      | {H} Coupe | {H} 12,456 | {H}  5   |
    And preview table is displayed as below
      | identifier | Name  | Phone  | National |
      | 4          | Coupe | 12,456 | 5        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM82 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Longest survivor field type is Email
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 41"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Rank  | Company      | Country/Territory | Email             |
      | 1     | 1     | LG           | Vietnam           | lg@mail.com       |
      | 2     | 2     | Dell         | Singapore         | {H} dell@mail.com |
      | 3     | 5     | Lock         | China             | lock@mail.com     |
      | {H} 4 | {H} 3 | {H} Facebook | {H} US            | fb@mail.com       |
    And preview table is displayed as below
      | ID | Rank | Company  | Country/Territory | Email         |
      | 4  | 3    | Facebook | US                | dell@mail.com |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

#  @Survivor_Field_Longest
#  Scenario: SC-MPMM83 Validate the pre-selected records at merge view screen when  the Merge function of survivor field is Longest  survivor field type is Html
#    Given I login to EBX successfully
#    And I access dataspace "Master Data - Reference>Resource"
#    And I access dataset "Updater"
#    And I access table "Table 42"
#    When I select first "4" records in table
#    And I select table service "Match and Merge > Merge"
#    Then record view table will be displayed and highlighted as below
#      | ID    | Company   | Country/Territory | Sales  | Comment  | Website |
#      | 1     | LG        | Vietnam           | 100    | LG VN    | {H}     |
#      | 2     | Lock      | US                | 200    | Lock US  |         |
#      | 3     | Apple     | US                | 300    | Apple US |         |
#      | {H} 4 | {H} Irock | {H} UK            | {H} 10 | Irock UK |         |
#    And preview table is displayed as below
#      | ID | Company | Country/Territory | Sales | Comment  | Website |
#      | 4  | Irock   | UK                | 10    | Irock UK | ABC     |
#    And the screen displays buttons as below
#      | Name               | Status   |
#      | Apply merge policy |          |
#      | Cancel last action | inactive |

  Scenario: SC-MPMM84 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Longest survivor field type is FK
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 43"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name      | Phone     | National |
      | 1          | Jenny     | 21,356    | {H} 1    |
      | 2          | Kimmy     | 784,569   | 2        |
      | 3          | Johnny    | 123,456   | 3        |
      | {H} 4      | {H} Clara | {H} 1,346 | 4        |
    And preview table is displayed as below
      | identifier | Name  | Phone | National |
      | 4          | Clara | 1,346 | 1        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM85 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Min and the sources of survivor field are different lenght
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 39"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name      | Phone   | National | Date           |
      | 1          | Sushi     | 123,456 | 1        | 04/01/2019     |
      | 2          | Chloe     | {H} 123 | 4        | 06/06/2019     |
      | 3          | Kenny     | 789,456 | 4        | 06/06/2019     |
      | {H} 4      | {H} Sammy | 123,456 | {H} 3    | {H} 06/23/2019 |
    And preview table is displayed as below
      | identifier | Name  | Phone | National | Date       |
      | 4          | Sammy | 123   | 3        | 06/23/2019 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM86 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Min and the sources of survivor field are same lenght
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 45"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Company  | Country/Territory | Sales  |
      | 1     | Topping  | VN                | 10     |
      | 2     | Tea      | UK                | 10     |
      | 3     | Hope     | US                | 10     |
      | {H} 4 | {H} Esti | {H} Singapore     | {H} 10 |
    And preview table is displayed as below
      | ID | Company | Country/Territory | Sales |
      | 4  | Esti    | Singapore         | 10    |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM87 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Min and survivor field type is Date
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 401"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name   | Phone       | National | Date           |
      | 1          | ONVN   | 31,456      | 1        | {H} 05/23/2019 |
      | 2          | TBC    | 124,566     | 2        | 07/24/2019     |
      | 3          | LG     | 124,566     | 3        | 06/11/2019     |
      | {H} 4      | {H} VN | {H} 456,789 | {H}  4   | 06/05/2019     |
    And preview table is displayed as below
      | identifier | Name | Phone   | National | Date       |
      | 4          | VN   | 456,789 | 4        | 05/23/2019 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM88 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Min and survivor field type is Date and time
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 49"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Company | Country/Territory | Sales        | Date and time           |
      | 1     | ON      | US                | 10.2         | 06/24/2019 14:34:50     |
      | 2     | LG      | UK                | 20.2         | {H} 06/24/2019 12:35:07 |
      | 3     | VN      | VN                | 100.2        | 06/24/2019 14:35:27     |
      | {H} 4 | {H} TB  | {H} US            | {H}     10.2 | 06/25/2019 14:36:02     |
    And preview table is displayed as below
      | ID | Company | Country/Territory | Sales | Date and time       |
      | 4  | TB      | US                | 10.2  | 06/24/2019 12:35:07 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM89 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Min and survivor field type is Time
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 50"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name              | Phone      | National | Time         |
      | 1          | ACS               | 123        | 1        | 14:42:35     |
      | 2          | Banco Santander   | 46,789     | 2        | 10:42:53     |
      | 3          | Barclays          | 45,789     | 3        | {H} 01:43:10 |
      | {H} 4      | {H} Computershare | {H} 78,945 | {H}  4   | 14:20:32     |
    And preview table is displayed as below
      | identifier | Name          | Phone  | National | Time     |
      | 4          | Computershare | 78,945 | 4        | 01:43:10 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM90 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Max and the sources of survivor field are different lenght
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 44"

    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Rank  | Company   | Country/Territory | Catalog            |
      | 1     | {H} 3 | Linked in | US                | [List] 0/2         |
      | 2     | 2     | Terminate | UK                | [List] 0/1         |
      | 3     | 2     | Big C     | Singapore         | [List] 0/4         |
      | {H} 4 | 1     | {H} L&L   | {H} VN            | {H}     [List] 4/4 |
    And preview table is displayed as below
      | ID | Rank | Company | Country/Territory | Catalog    |
      | 4  | 3    | L&L     | VN                | [List] 4/4 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM91 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Max and the sources of survivor field are same lenght
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 46"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Rank  | Company   | Country/Territory | Catalog            |
      | 1     | {H} 3 | Linked in | US                | [List] 0/2         |
      | 2     | 2     | Terminate | UK                | [List] 0/1         |
      | 3     | 2     | Big C     | Singapore         | [List] 0/4         |
      | {H} 4 | 1     | {H} L&L   | {H} VN            | {H}     [List] 4/4 |
    And preview table is displayed as below
      | ID | Rank | Company | Country/Territory | Catalog    |
      | 4  | 3    | L&L     | VN                | [List] 4/4 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM92 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Max and survivor field type is Date
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 51"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name              | Phone      | National | Date           |
      | 1          | Ferrovial[        | 12,346     | 1        | 06/24/2019     |
      | 2          | HSBC              | 1,256      | 2        | 06/23/2019     |
      | 3          | Iberdrola         | 897,564    | 3        | 06/04/2019     |
      | {H} 4      | {H} National Grid | {H} 21,456 | {H}  4   | {H} 06/24/2019 |
    And preview table is displayed as below
      | identifier | Name          | Phone  | National | Date       |
      | 4          | National Grid | 21,456 | 4        | 06/24/2019 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM93 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Max and survivor field type is Date and time
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 52"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Company                  | Country/Territory | Sales       | Date and time           |
      | 1     | Pennon Group             | 984               | 102         | 06/24/2019 15:21:37     |
      | 2     | Repsol                   | 456               | 10.3        | 06/24/2019 15:21:56     |
      | 3     | Rolls Royce              | 15789             | 1000        | {H} 06/24/2019 22:22:20 |
      | {H} 4 | {H} Southside Bancshares | {H} 7894          | {H}     200 | 06/24/2019 10:22:38     |
    And preview table is displayed as below
      | ID | Company              | Country/Territory | Sales | Date and time       |
      | 4  | Southside Bancshares | 7894              | 200   | 06/24/2019 22:22:20 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM94 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Max and survivor field type is Time
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 53"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name              | Phone      | National | Time         |
      | 1          | Royal Dutch Shell | 78,456     | 1        | 15:26:17     |
      | 2          | Banco Santander   | 245        | 2        | {H} 23:26:32 |
      | 3          | National Grid     | 21,456     | 3        | 10:27:00     |
      | {H} 4      | {H} Repsol        | {H} 23,456 | {H}  5   | 15:27:26     |
    And preview table is displayed as below
      | identifier | Name   | Phone  | National | Time     |
      | 4          | Repsol | 23,456 | 5        | 23:26:32 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM76 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Last update and the updated date of survivor field are different
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 34"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name      | Phone       | National |
      | 1          | Micheal   | 125         | 1        |
      | 2          | Richer    | 2,154       | 2        |
      | 3          | {H} Sarah | 23,306,656  | 3        |
      | {H} 4      | Bella     | {H} 231,456 | {H}  4   |
    And preview table is displayed as below
      | identifier | Name  | Phone   | National |
      | 4          | Sarah | 231,456 | 4        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM77 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Last update and the updated date of survivor field are the same
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 35"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name      | Phone      | National |
      | 1          | Tony      | 13,456     | 1        |
      | 2          | {H} Chloe | 89,452,132 | 2        |
      | 3          | Ruby      | 1,245,612  | 3        |
      | {H} 4      | Kenny     | {H} 87,456 | {H}  5   |
    And preview table is displayed as below
      | identifier | Name  | Phone  | National |
      | 4          | Chloe | 87,456 | 5        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM78 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Last update and Default merge function is defined also
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 36"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name        | Phone      | National  |
      | 1          | Sophie      | 123,456    | {H}     1 |
      | 2          | {H} Vinniee | 123,456    | 2         |
      | 3          | Neon        | 123,456    | 3         |
      | {H} 4      | Jonhny      | {H} 12,546 | 4         |
    And preview table is displayed as below
      | identifier | Name    | Phone  | National |
      | 4          | Vinniee | 12,546 | 1        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM79 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Last update and survivor field type is multi value
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Multiple"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Rank    | Company      | Country/Territory | Catalog        |
      | 1     | 1       | Tibco        | US                | {H} [List] 3/3 |
      | 2     | 2       | Orchestra    | FR                | [List] 0/1     |
      | 3     | 3       | Linked in    | US                | [List] 0/3     |
      | {H} 4 | {H}   4 | {H} Facebook | {H} UK            | [List] 0/4     |
    And preview table is displayed as below
      | ID | Rank | Company  | Country/Territory | Catalog    |
      | 4  | 4    | Facebook | UK                | [List] 3/3 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM73 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Most frequent and the the source of survivor field are different appearance
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 31"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name     | Phone     | National    |
      | 1          | Gennie   | 12,456    | 1           |
      | 2          | Luna     | 8,745     | 2           |
      | 3          | Itstu    | 45        | 4           |
      | {H} 4      | {H} Luna | {H} 4,698 | {H}       5 |
    And preview table is displayed as below
      | identifier | Name | Phone | National |
      | 4          | Luna | 4,698 | 5        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |


  Scenario: SC-MPMM74 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Most frequent and the the source of survivor field are same appearance
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 32"
    When I select first "5" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name     | Phone      | National    |
      | 1          | Alex     | 15         | 1           |
      | 2          | Jasmine  | 12         | 2           |
      | 3          | Alex     | 15,346     | 2           |
      | 4          | Luna     | 78,456     | 4           |
      | {H} 5      | {H} Luna | {H} 75,663 | {H}       5 |
    And preview table is displayed as below
      | identifier | Name | Phone  | National |
      | 5          | Luna | 75,663 | 5        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM75 Validate the pre-selected records at merge view screen when the Merge function of survivor field is Most frequent and the Default merge function is defined
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 33"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | identifier | Name     | Phone      | National |
      | 1          | Magnus   | 15         | 1        |
      | 2          | Alan     | 12         | 2        |
      | 3          | Jessie   | 15,346     | 2        |
      | {H}  4     | {H} Alan | {H} 78,456 | {H} 4    |
    And preview table is displayed as below
      | identifier | Name | Phone  | National |
      | 4          | Alan | 78,456 | 4        |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM95 Validate the pre-selected records at merge view screen when the Merge function of survivor field is No merge
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 47"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Rank    | Company | Country/Territory | Catalog        |
      | 1     | 1       | A       | US                | [List] 0/1     |
      | 2     | 2       | B       | UK                | [List] 0/1     |
      | 3     | 3       | C       | FR                | [List] 0/1     |
      | {H} 4 | {H}   1 | {H} D   | {H} VN            | {H} [List] 1/1 |
    And preview table is displayed as below
      | ID | Rank | Company | Country/Territory | Catalog    |
      | 4  | 1    | D       | VN                | [List] 1/1 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |

  Scenario: SC-MPMM96 Validate the pre-selected records at merge view screen when Condition for field value survivorship is defined and Execute if empty is Yes and the value of the survivor record is null
    Given I login to EBX successfully
    And I access dataspace "Master Data - Reference>Resource"
    And I access dataset "Updater"
    And I access table "Table 48"
    When I select first "4" records in table
    And I select table service "Match and Merge > Merge"
    Then record view table will be displayed and highlighted as below
      | ID    | Rank    | Company | Country/Territory | Catalog        |
      | 1     | 1       | A       | US                | [List] 0/1     |
      | 2     | 2       | B       | UK                | [List] 0/1     |
      | 3     | 3       | C       | FR                | [List] 0/1     |
      | {H} 4 | {H}   1 | {H} D   | {H} VN            | {H} [List] 1/1 |
    And preview table is displayed as below
      | ID | Rank | Company | Country/Territory | Catalog    |
      | 4  | 1    | D       | VN                | [List] 1/1 |
    And the screen displays buttons as below
      | Name               | Status   |
      | Apply merge policy |          |
      | Cancel last action | inactive |