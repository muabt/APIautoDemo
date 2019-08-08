@DMDV110
Feature: US04-Node Styles

  Background: 
    Given I login to EBX succesfully


  @VaidateDefaultStyles 
    Scenario Outline: (US04-05)- Check saved Table config when input Blank background, border, text colors on Styles 
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<color-style>" to Styles Default on Node Style
    And error message shouldn't be display under fields
    And click save button
    And error message shouldn't be display under fields

    Examples: 
      | configuration-name | table-name | color-style | error-message | 
      | DM1_US04_02        | tableLayer2|             |        |

  Scenario Outline: (US04-05)- Check saved Table config when input blank Border Width on Styles 
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And only input Border Width "<Border-Width>" to Styles Default on Node Style
    Then error message "<error-message>" should be display under Style fields
    And click save button
    And error message shouldn't be display under fields

    Examples: 
      | configuration-name | table-name | Border-Width| error-message                             |
      | DM1_US04_02        | tableLayer2|             | Field 'Border Width' is mandatory.  |

  Scenario Outline: (US04-05)- Check saved Table config when input blank Border Style on Styles 
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And only input Border Style "<Border-Style>" to Styles Default on Node Style
    Then error message "<error-message>" should be display under Style fields
    Then verify "<Border-Style1>" when was saved

    Examples: 
      | configuration-name | table-name | Border-Style | error-message                      |Border-Style1|
      | DM1_US04_02        | tableLayer2| [not defined]| Field 'Border Style' is mandatory. |    Solid   |
      
  
   Scenario Outline: (US04-06)- Check saved Table config when input invalid background, border, text colors on Styles 
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<color-style>" to Styles Default on Node Style
    Then error message "<error-message>" should be display under Style fields
    And click save button
    Then error message "<error-message>" should be display under Style fields

    Examples: 
      | configuration-name | table-name | color-style | error-message                             |
      | DM1_US04_02        | tableLayer2| aaa         | Input value '#aaa' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| 'C5E3'     | Input value '#'C5E3'' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| 1234*4      | Input value '#1234*4' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| $^$%&^     | Input value '#$^$%&^' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |

     
  Scenario Outline: (US04-06)- Check saved Table config when input invalid Border Width on Styles 
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And only input Border Width "<Border-Width>" to Styles Default on Node Style
    Then error message "<error-message>" should be display under Style fields
    And click save button
    Then error message "<error-message>" should be display under Style fields

    Examples: 
      | configuration-name | table-name | Border-Width| error-message                             |
      | DM1_US04_02        | tableLayer2| aaa1233     | Input value 'aaa1233' is not an integer. |
      | DM1_US04_02        | tableLayer2| -1          | Value must be greater than or equal to 1. |
      | DM1_US04_02        | tableLayer2| 0           | Value must be greater than or equal to 1. |
      | DM1_US04_02        | tableLayer2| 5           | Value must be less than or equal to 4.  |
      | DM1_US04_02        | tableLayer2| 100000000   | Value must be less than or equal to 4.  |

   
  Scenario Outline: (US04-08)- Check saved Table config when input valid background, border, text colors on Styles 
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<color-style>" to Styles Default on Node Style
    Then verify display "<color-style1>" when was saved
    #And click save button
    #And input color style by Color picker
    And error message shouldn't be display under fields

    Examples: 
      | configuration-name | table-name | color-style | color-style1  |
      | DM1_US04_02        | tableLayer2| C45454    | C45454    |
      | DM1_US04_02        | tableLayer2| ffffff    | ffffff    |
      | DM1_US04_02        | tableLayer2| 000000    | 000000    |

      
      
  Scenario Outline: (US04-08, US04-07)- Check saved Table config when input valid Border Style on Styles
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And only input Border Width "<Border-Width>" to Styles Default on Node Style
    Then verify displays "<Border-Width1>" when was saved
    #And click save button
    And error message shouldn't be display under fields


    Examples: 
      | configuration-name | table-name | Border-Width| Border-Width1|
      | DM1_US04_02        | tableLayer2| 4           | 4            |
      | DM1_US04_02        | tableLayer2| 3           | 3            |
      | DM1_US04_02        | tableLayer2| 2           | 2            |
      | DM1_US04_02        | tableLayer2| 1           | 1            |    
 

  Scenario Outline: (US04-08, US04-07)- Check saved Table config when input invalid Border Style on Styles
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And only input Border Style "<Border-Style>" to Styles Default on Node Style
    Then verify "<Border-Style1>" when was saved
    And error message shouldn't be display under fields

    Examples: 
      | configuration-name | table-name | Border-Style | Border-Style1|
      | DM1_US04_02        | tableLayer2| Dotted       |   Dotted   |  
      | DM1_US04_02        | tableLayer2| Dashed       |   Dashed   |  
      | DM1_US04_02        | tableLayer2| Solid        |   Solid    |  


  @ValidateBackgroundcolors 
  
  Scenario Outline: (US04-10)- Check saved Table config when input Blank Label in legend, Color, Condition on Background colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Background Color
    Then error message "<error-message>" should be display
    And click save button
    Then error message "<error-message>" should be display under Backgroundcolors fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      |error-message                        |
      #| DM1_US04_02        | tableLayer2|                                                 | C5E3FD   | ./NameLa = 'La'|Field 'Label in legend' is mandatory.| 
      | DM1_US04_02        | tableLayer2| BlankColor                                      |          | ./NameLa = 'La'|Field 'Color' is mandatory.          | 
      | DM1_US04_02        | tableLayer2| BlankCondition                                  | C5E3FD   |                |Field 'Condition' is mandatory.| 

  Scenario Outline: (US04-11-> 14, US04-20-> 26)- Check saved Table config when input Valid Label in legend, Color, Condition on Background colors 
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Background Color
    Then verify "<Label-in-legendExp>" and "<ColorExp>" and "<ConditionExp>" for Background Color when were saved
    And error message shouldn't be display under fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      | Label-in-legendExp                              | ColorExp | ConditionExp   | 

      | DM1_US04_02        | tableLayer2| aaaa                                            | C5E3FD   | ./NameLa = 'La | aaaa                                            | C5E3FD   | ./NameLa = 'La |      
      | DM1_US04_02        | tableLayer2| 1234            																| C5E3FD   | ./NameLa = 'La'| 1234            																| C5E3FD   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa 123245                                     | C5E3FD   | ./NameLa = 'La'| aaaa 123245                                     | C5E3FD   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa''£$££%$                                    | 5B96CA   | ./NameLa = 'La'| aaaa''£$££%$                                    | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..                                     | 5B96CA   | ./NameLa = 'La'| $%££&**()..                                     | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| '<span style='color:orange'> warning </span>'   | 5B96CA   | ./NameLa = 'La'| '<span style='color:orange'> warning </span>'   | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'|
  
      | DM1_US04_02        | TableA     | CheckPK                                         | C5E3FD   | ./ID = 5       | CheckPK                                         | C5E3FD   | ./ID = 5       |
      | DM1_US04_02        | TableA     | CheckFK                                         | C5E3FD   | ./FKAB ='1\|1' | CheckFK                                         | C5E3FD   | ./FKAB ='1\|1' |
      | DM1_US04_02        | TableA     | Checknormal field(/Table)                       | C5E3FD   | ./Age= ./ID+3  | Checknormal field(/Table)                       | C5E3FD   | ./Age= ./ID+3  |
      | DM1_US04_02        | TableA     | Checkfield(/Table/ Group)                       | C5E3FD   | date-equal(./GroupA1/DateA, current-date())  | Checkfield(/Table/ Group)                     | C5E3FD   | date-equal(./GroupA1/DateA, current-date())|
      | DM1_US04_02        | TableA     | Checkfield(Table/Group/ Group)                  | C5E3FD   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|Checkfield(Table/Group/ Group)                 | C5E3FD   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table)                       | C5E3FD   | contains(./NameLa, 'La1')                    | Checkfield(/Group/ Table)                     | C5E3FD   | contains(./NameLa, 'La1')|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table/ Group(ComplexType))   | C5E3FD   | ./Base2/nameBase2 = 'BaseLa1'                | Checkfield(/Group/ Table/ Group(ComplexType)) | C5E3FD   | ./Base2/nameBase2 = 'BaseLa1'|     
      | DM1_US04_02        | TableA     | Checkrandom                                     | C5E3FD   | ./ID=6 or ./ID=9                               | Checkrandom     | C5E3FD   | ./ID=6 or ./ID=9   |
      | DM1_US04_02        | TableA     | Checkrandom                                     | C5E3FD   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()| Checkrandom     | C5E3FD   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()   |
  
  Scenario Outline: (US04-15, US04-17-> 19)- Check saved Table config when input InValid Label in legend, Color, Condition on Background colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Background Color
    Then error message "<error-message>" should be display
    And click save button
    Then error message "<error-message>" should be display under Backgroundcolors fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      |error-message                        |

      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | C5E3F    | ./NameLa = 'La'                                     |Input value '#C5E3F' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | aaaaa    | ./NameLa = 'La'                                     |Input value '#aaaaa' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | 1234(6   | ./NameLa = 'La'                                     |Input value '#1234(6' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | $%^&*()  | ./NameLa = 'La'                                     |Input value '#$%^&*(' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |

      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ParentA                                           | Invalid XPath predicate expression [/ParentA].   |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | floor(number)                                       | Invalid XPath predicate expression               | 
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | and                                                 | Invalid XPath predicate expression [and].        |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./Age = day-from-dateTime(/GroupA1/TimeA)           | Invalid XPath predicate expression               |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NumberA=ceiling(${../NumberA2})                   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NumberA=ceiling(./NumberA2)                       | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID1 ='A9' and ./FKAB ='B9' and ./NumberA2 = 3.1   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NameA>5                                           | An unknown predicate operator has been detected: >.  |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NameA = A                                         | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID =abc                                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | starts-with(./NameA,A1)                             | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | contains(./NameA,A1)                                | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | contains(./NameA,1)                                 | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID1 = substring(./NameA,abc,2)                    | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | starts-with( ./ID2, 'A' )                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID2>5                                             | Invalid XPath predicate expression               |
         
 
 @ValidateBordercolors
 
    Scenario Outline: US04-30 - Check saved Table config when input Blank Label in legend, Color, Condition on Border colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Border Color
    Then error message "<error-message>" should be display
    And click save button    
    Then error message "<error-message>" should be display under Bordercolors fields    
   

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      |error-message                        |
      #| DM1_US04_02        | tableLayer2|                                                 | C5E3FD   | ./NameLa = 'La'|Field 'Label in legend' is mandatory.| 
      | DM1_US04_02        | tableLayer2| BlankColor                                      |          | ./NameLa = 'La'|Field 'Color' is mandatory.          | 
      | DM1_US04_02        | tableLayer2| BlankCondition                                  | C5E3FD   |                |Field 'Condition' is mandatory.| 
 
   Scenario Outline: (US04-31-> 34, US04-40-> 46)- Check saved Table config when input Valid Label in legend, Color, Condition on Border colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Border Color
    Then verify "<Label-in-legendExp>" and "<ColorExp>" and "<ConditionExp>" for Border Color when were saved
    And error message shouldn't be display under fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      | Label-in-legendExp                              | ColorExp | ConditionExp   | 

      | DM1_US04_02        | tableLayer2| aaaa                                            | C5E3FD   | ./NameLa = 'La'| aaaa                                            | C5E3FD   | ./NameLa = 'La'|      
      | DM1_US04_02        | tableLayer2| 1234            																| C5E3FD   | ./NameLa = 'La'| 1234            																| C5E3FD   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa 123245                                     | C5E3FD   | ./NameLa = 'La'| aaaa 123245                                     | C5E3FD   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa''£$££%$                                    | 5B96CA   | ./NameLa = 'La'| aaaa''£$££%$                                    | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..                                     | 5B96CA   | ./NameLa = 'La'| $%££&**()..                                     | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| '<span style='color:orange'> warning </span>'   | 5B96CA   | ./NameLa = 'La'| '<span style='color:orange'> warning </span>'   | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'|
    
      | DM1_US04_02        | TableA     | CheckPK                                         | C5E3FD   | ./ID = 5       | CheckPK                                         | C5E3FD   | ./ID = 5       |
      | DM1_US04_02        | TableA     | CheckFK                                         | C5E3FD   | ./FKAB ='1\|1' | CheckFK                                         | C5E3FD   | ./FKAB ='1\|1' |
      | DM1_US04_02        | TableA     | Checknormal field(/Table)                       | C5E3FD   | ./Age= ./ID+3  | Checknormal field(/Table)                       | C5E3FD   | ./Age= ./ID+3  |
      | DM1_US04_02        | TableA     | Checkfield(/Table/ Group)                       | C5E3FD   | date-equal(./GroupA1/DateA, current-date())  | Checkfield(/Table/ Group)                     | C5E3FD   | date-equal(./GroupA1/DateA, current-date())|
      | DM1_US04_02        | TableA     | Checkfield(Table/Group/ Group)                  | C5E3FD   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|Checkfield(Table/Group/ Group)                 | C5E3FD   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table)                       | C5E3FD   | contains(./NameLa, 'La1')                    | Checkfield(/Group/ Table)                     | C5E3FD   | contains(./NameLa, 'La1')|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table/ Group(ComplexType))   | C5E3FD   | ./Base2/nameBase2 = 'BaseLa1'                | Checkfield(/Group/ Table/ Group(ComplexType)) | C5E3FD   | ./Base2/nameBase2 = 'BaseLa1'|     
      | DM1_US04_02        | TableA     | Checkrandom                                     | C5E3FD   | ./ID=6 or ./ID=9                               | Checkrandom     | C5E3FD   | ./ID=6 or ./ID=9   |
      | DM1_US04_02        | TableA     | Checkrandom                                     | C5E3FD   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()| Checkrandom     | C5E3FD   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()   |
      
   Scenario Outline: (US04-35, US04-37-> 39)- Check saved Table config when input InValid  Label in legend, Color, Condition on Border colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Border Color
    Then error message "<error-message>" should be display
    And click save button    
    Then error message "<error-message>" should be display under Bordercolors fields    
    

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      |error-message                        |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | C5E3F    | ./NameLa = 'La'                                     |Input value '#C5E3F' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | aaaaa    | ./NameLa = 'La'                                     |Input value '#aaaaa' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | 1234(6   | ./NameLa = 'La'                                     |Input value '#1234(6' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | $%^&*()  | ./NameLa = 'La'                                     |Input value '#$%^&*(' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |

      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ParentA                                           | Invalid XPath predicate expression [/ParentA].   |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | floor(number)                                       | Invalid XPath predicate expression               | 
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | and                                                 | Invalid XPath predicate expression [and].        |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./Age = day-from-dateTime(/GroupA1/TimeA)           | Invalid XPath predicate expression               |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NumberA=ceiling(${../NumberA2})                   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NumberA=ceiling(./NumberA2)                       | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID1 ='A9' and ./FKAB ='B9' and ./NumberA2 = 3.1   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NameA>5                                           | An unknown predicate operator has been detected: >.  |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NameA = A                                         | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID =abc                                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | starts-with(./NameA,A1)                             | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | contains(./NameA,A1)                                | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | contains(./NameA,1)                                 | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID1 = substring(./NameA,abc,2)                    | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | starts-with( ./ID2, 'A' )                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID2>5                                             | Invalid XPath predicate expression               |
 
  @ValidateBorderWidths
  
     Scenario Outline: US04-50- Check saved Table config when input Blank Label in legend, Condition on Border Widths
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Width>" and "<Condition>" for Border Width
    Then error message "<error-message>" should be display
    And click save button    
    Then error message "<error-message>" should be display under Borderwidths fields    
    

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Width    | Condition      |error-message                        |
      #| DM1_US04_02        | tableLayer2|                                                 | 2        | ./NameLa = 'La'|Field 'Label in legend' is mandatory.| 
      | DM1_US04_02        | tableLayer2| BlankCondition                                  | 2        |                |Field 'Condition' is mandatory.| 

   Scenario Outline: US04-50- Check saved Table config when input Blank Width on Border Widths
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Width>" and "<Condition>" for Border Width
    #Then error message "<error-message>" should be display
    And click save button    
    Then error message "<error-message>" should be display under Borderwidths fields    
    

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Width    | Condition      |error-message                        |
      | DM1_US04_02        | tableLayer2| BlankWidth                                      |          | ./NameLa = 'La'|Field 'Width' is mandatory.          | 

   Scenario Outline: (US04-51-> 54, US04-60-> 66)- Check saved Table config when input Valid Label in legend, Width, Condition on Border Widths
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Width>" and "<Condition>" for Border Width
    Then verify "<Label-in-legendExp>" and "<WidthExp>" and "<ConditionExp>" for Border Width when were saved
    And error message shouldn't be display under fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Width    | Condition      | Label-in-legendExp                              | WidthExp | ConditionExp   | 

      | DM1_US04_02        | tableLayer2| aaaa                                            | 1        | ./NameLa = 'La'| aaaa                                            | 1        | ./NameLa = 'La'|      
      | DM1_US04_02        | tableLayer2| 1234            																| 2        | ./NameLa = 'La'| 1234            																| 2        | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa 123245                                     | 3        | ./NameLa = 'La'| aaaa 123245                                     | 3        | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa''£$££%$                                    | 4        | ./NameLa = 'La'| aaaa''£$££%$                                    | 4        | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..                                     | 3        | ./NameLa = 'La'| $%££&**()..                                     | 3        | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| '<span style='color:orange'> warning </span>'   | 2        | ./NameLa = 'La'| '<span style='color:orange'> warning </span>'   | 2        | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'|
    
      | DM1_US04_02        | TableA     | CheckPK                                         | 3        | ./ID = 5       | CheckPK                                         | 3        | ./ID = 5       |
      | DM1_US04_02        | TableA     | CheckFK                                         | 3        | ./FKAB ='1\|1' | CheckFK                                         | 3        | ./FKAB ='1\|1' |
      | DM1_US04_02        | TableA     | Checknormal field(/Table)                       | 3        | ./Age= ./ID+3  | Checknormal field(/Table)                       | 3        | ./Age= ./ID+3  |
      | DM1_US04_02        | TableA     | Checkfield(/Table/ Group)                       | 3        | date-equal(./GroupA1/DateA, current-date())  | Checkfield(/Table/ Group)                     | 3        | date-equal(./GroupA1/DateA, current-date())|
      | DM1_US04_02        | TableA     | Checkfield(Table/Group/ Group)                  | 3        | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|Checkfield(Table/Group/ Group)                 | 3        | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table)                       | 3        | contains(./NameLa, 'La1')                    | Checkfield(/Group/ Table)                     | 3        | contains(./NameLa, 'La1')|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table/ Group(ComplexType))   | 3        | ./Base2/nameBase2 = 'BaseLa1'                | Checkfield(/Group/ Table/ Group(ComplexType)) | 3        | ./Base2/nameBase2 = 'BaseLa1'|     
      | DM1_US04_02        | TableA     | Checkrandom                                     | 3        | ./ID=6 or ./ID=9                               | Checkrandom     | 3        | ./ID=6 or ./ID=9   |
      | DM1_US04_02        | TableA     | Checkrandom                                     | 3        | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()| Checkrandom     | 3        | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()   |
       
   Scenario Outline: (US04-55, US04-57-> 59)- Check saved Table config when input InValid Label in legend, Width, Condition on Border Widths
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Width>" and "<Condition>" for Border Width
    Then error message "<error-message>" should be display
    And click save button    
    Then error message "<error-message>" should be display under Borderwidths fields    
    

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Width    | Condition      |error-message                        |
      #| DM1_US04_02        | tableLayer2| Check Invalid Width                             | -3        | ./NameLa = 'La'                                     |Value must be greater than or equal to 1. |
      | DM1_US04_02        | tableLayer2| Check Invalid Width                             | a464      | ./NameLa = 'La'                                     |Input value 'a464' is not an integer.     |
      | DM1_US04_02        | tableLayer2| Check Invalid Width                             | $^%$&%^   | ./NameLa = 'La'                                     |Input value '$^%$&%^' is not an integer.     |
      | DM1_US04_02        | tableLayer2| Check Invalid Width                             | '<span style='color:orange'> warning </span>'  | ./NameLa = 'La'|Input value ''<span style='color:orange'> warning </span>'' is not an integer.     |
      #| DM1_US04_02        | tableLayer2| Check Invalid Width                             | 5         | ./NameLa = 'La'                                     |Value must be less than or equal to 4. |
 
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./ParentA                                           | Invalid XPath predicate expression [/ParentA].   |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | floor(number)                                       | Invalid XPath predicate expression               | 
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | and                                                 | Invalid XPath predicate expression [and].        |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | 4       | ./Age = day-from-dateTime(/GroupA1/TimeA)           | Invalid XPath predicate expression               |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | 4       | ./NumberA=ceiling(${../NumberA2})                   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./NumberA=ceiling(./NumberA2)                       | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./ID1 ='A9' and ./FKAB ='B9' and ./NumberA2 = 3.1   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./NameA>5                                           | An unknown predicate operator has been detected: >.  |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./NameA = A                                         | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./ID =abc                                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | starts-with(./NameA,A1)                             | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | contains(./NameA,A1)                                | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | contains(./NameA,1)                                 | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./ID1 = substring(./NameA,abc,2)                    | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | starts-with( ./ID2, 'A' )                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | 4        | ./ID2>5                                             | Invalid XPath predicate expression               |
    
   Scenario Outline: (US04-55, US04-57-> 59)- Check saved Table config when input Invalid Width on Border Widths
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Width>" and "<Condition>" for Border Width
    #Then error message "<error-message>" should be display
    And click save button    
    Then error message "<error-message>" should be display under Borderwidths fields    
    

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Width    | Condition      |error-message                        |
      | DM1_US04_02        | tableLayer2| Check Invalid Width                             | -3        | ./NameLa = 'La'                                     |Value must be greater than or equal to 1. |
      | DM1_US04_02        | tableLayer2| Check Invalid Width                             | 5         | ./NameLa = 'La'                                     |Value must be less than or equal to 4. |
   
 @ValidateBorderStyles
 
    Scenario Outline: US04-70- Check saved Table config when input Blank Label in legend, Style on Border Styles
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Style>" and "<Condition>" for Border Style
    Then error message "<error-message>" should be display
    And click save button    
	  Then error message "<error-message>" should be display under Borderstyles fields    
    

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Style    | Condition      |error-message                        |
      #| DM1_US04_02        | tableLayer2|                                                 | Dotted   | ./NameLa = 'La'|Field 'Label in legend' is mandatory.| 
      | DM1_US04_02        | tableLayer2| BlankStyle                                      | not defined | ./NameLa = 'La'|          | 
      | DM1_US04_02        | tableLayer2| BlankCondition                                  | Dashed   |                |Field 'Condition' is mandatory.| 
 
   Scenario Outline: (US04-71-> 74, US04-79-> 85)- Check saved Table config when input Valid Label in legend, Style, Condition on Border Styles
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Style>" and "<Condition>" for Border Style
    Then verify "<Label-in-legendExp>" and "<StyleExp>" and "<ConditionExp>" for Border Style when were saved
    And error message shouldn't be display under fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Style    | Condition      | Label-in-legendExp                              | StyleExp | ConditionExp   | 

      | DM1_US04_02        | tableLayer2| aaaa                                            | Solid    | ./NameLa = 'La'| aaaa                                            | Solid    | ./NameLa = 'La'|      
      | DM1_US04_02        | tableLayer2| 1234            																 | Solid    | ./NameLa = 'La'| 1234            																 |  Solid    | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa 123245                                     | Solid    | ./NameLa = 'La'| aaaa 123245                                     |  Solid    | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa''£$££%$                                    | Solid    | ./NameLa = 'La'| aaaa''£$££%$                                    |  Solid    | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..                                     | Solid    | ./NameLa = 'La'| $%££&**()..                                     |  Solid    | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| '<span style='color:orange'> warning </span>'   | Solid    | ./NameLa = 'La'| '<span style='color:orange'> warning </span>'   |  Solid    | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     |  Solid    | ./NameLa = 'La'| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     |  Solid    | ./NameLa = 'La'|
    
      | DM1_US04_02        | TableA     | CheckPK                                         | Dashed   | ./ID = 5       | CheckPK                                         | Dashed   | ./ID = 5       |
      | DM1_US04_02        | TableA     | CheckFK                                         | Dashed   | ./FKAB ='1\|1' | CheckFK                                         | Dashed   | ./FKAB ='1\|1' |
      | DM1_US04_02        | TableA     | Checknormal field(/Table)                       | Dashed   | ./Age= ./ID+3  | Checknormal field(/Table)                       | Dashed   | ./Age= ./ID+3  |
      | DM1_US04_02        | TableA     | Checkfield(/Table/ Group)                       | Dashed   | date-equal(./GroupA1/DateA, current-date())  | Checkfield(/Table/ Group)                     | Dashed   | date-equal(./GroupA1/DateA, current-date())|
      | DM1_US04_02        | TableA     | Checkfield(Table/Group/ Group)                  | Dashed   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|Checkfield(Table/Group/ Group)                 | Dashed   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table)                       | Dashed   | contains(./NameLa, 'La1')                    | Checkfield(/Group/ Table)                     | Dashed   | contains(./NameLa, 'La1')|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table/ Group(ComplexType))   | Dashed   | ./Base2/nameBase2 = 'BaseLa1'                | Checkfield(/Group/ Table/ Group(ComplexType)) | Dashed   | ./Base2/nameBase2 = 'BaseLa1'|     
      | DM1_US04_02        | TableA     | Checkrandom                                     | Dashed   | ./ID=6 or ./ID=9                               | Checkrandom     | Dashed   | ./ID=6 or ./ID=9   |
      | DM1_US04_02        | TableA     | Checkrandom                                     | Dashed   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()| Checkrandom     | Dashed   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()   |

   Scenario Outline: (US04-76-> US04-78)- Check saved Table config when input InValid Label in legend, Style on Border Styles
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Style>" and "<Condition>" for Border Style
    Then error message "<error-message>" should be display
    And click save button    
	  Then error message "<error-message>" should be display under Borderstyles fields    
    

    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Style    | Condition      |error-message                        |

      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dashed   | ./ParentA                                           | Invalid XPath predicate expression [/ParentA].   |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dashed   | floor(number)                                       | Invalid XPath predicate expression               | 
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dashed   | and                                                 | Invalid XPath predicate expression [and].        |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | Dashed   | ./Age = day-from-dateTime(/GroupA1/TimeA)           | Invalid XPath predicate expression               |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | Dashed   | ./NumberA=ceiling(${../NumberA2})                   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Solid    | ./NumberA=ceiling(./NumberA2)                       | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Solid    | ./ID1 ='A9' and ./FKAB ='B9' and ./NumberA2 = 3.1   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Solid    | ./NameA>5                                           | An unknown predicate operator has been detected: >.  |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Solid    | ./NameA = A                                         | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Solid    | ./ID =abc                                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dotted   | starts-with(./NameA,A1)                             | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dotted   | contains(./NameA,A1)                                | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dotted   | contains(./NameA,1)                                 | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dotted   | ./ID1 = substring(./NameA,abc,2)                    | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dotted   | starts-with( ./ID2, 'A' )                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | Dotted   | ./ID2>5                                             | Invalid XPath predicate expression               |
        
 @ValidateLabelcolors
 
 Scenario Outline: US04-89- Check saved Table config when input Blank Label in legend, Color, Condition on Label colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Label Color
    Then error message "<error-message>" should be display
    And click save button
    Then error message "<error-message>" should be display under Labelcolors fields

    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      |error-message                        |
      #| DM1_US04_02        | tableLayer2|                                                 | C5E3FD   | ./NameLa = 'La'|Field 'Label in legend' is mandatory.| 
      | DM1_US04_02        | tableLayer2| BlankColor                                      |          | ./NameLa = 'La'|Field 'Color' is mandatory.          | 
      | DM1_US04_02        | tableLayer2| BlankCondition                                  | C5E3FD   |                |Field 'Condition' is mandatory.| 

   Scenario Outline: (US04-90-> US04-93, US04-99-> US04-105)- Check saved Table config when input Valid Label in legend, Color, Condition on Label colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Label Color
    Then verify "<Label-in-legendExp>" and "<ColorExp>" and "<ConditionExp>" for Label Color when were saved
    And error message shouldn't be display under fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      | Label-in-legendExp                              | ColorExp | ConditionExp   | 

      | DM1_US04_02        | tableLayer2| aaaa                                            | C5E3FD   | ./NameLa = 'La'| aaaa                                            | C5E3FD   | ./NameLa = 'La'|      
      | DM1_US04_02        | tableLayer2| 1234            																| C5E3FD   | ./NameLa = 'La'| 1234            																| C5E3FD   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa 123245                                     | C5E3FD   | ./NameLa = 'La'| aaaa 123245                                     | C5E3FD   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| aaaa''£$££%$                                    | 5B96CA   | ./NameLa = 'La'| aaaa''£$££%$                                    | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..                                     | 5B96CA   | ./NameLa = 'La'| $%££&**()..                                     | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| '<span style='color:orange'> warning </span>'   | 5B96CA   | ./NameLa = 'La'| '<span style='color:orange'> warning </span>'   | 5B96CA   | ./NameLa = 'La'|
      | DM1_US04_02        | tableLayer2| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'| $%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test$%££&**()..Test     | 5B96CA   | ./NameLa = 'La'|
    
      | DM1_US04_02        | TableA     | CheckPK                                         | C5E3FD   | ./ID = 5       | CheckPK                                         | C5E3FD   | ./ID = 5       |
      | DM1_US04_02        | TableA     | CheckFK                                         | C5E3FD   | ./FKAB ='1\|1' | CheckFK                                         | C5E3FD   | ./FKAB ='1\|1' |
      | DM1_US04_02        | TableA     | Checknormal field(/Table)                       | C5E3FD   | ./Age= ./ID+3  | Checknormal field(/Table)                       | C5E3FD   | ./Age= ./ID+3  |
      | DM1_US04_02        | TableA     | Checkfield(/Table/ Group)                       | C5E3FD   | date-equal(./GroupA1/DateA, current-date())  | Checkfield(/Table/ Group)                     | C5E3FD   | date-equal(./GroupA1/DateA, current-date())|
      | DM1_US04_02        | TableA     | Checkfield(Table/Group/ Group)                  | C5E3FD   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|Checkfield(Table/Group/ Group)                 | C5E3FD   | ./NumberA=ceiling(./GroupA1/GroupA2/NumberA2)|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table)                       | C5E3FD   | contains(./NameLa, 'La1')                    | Checkfield(/Group/ Table)                     | C5E3FD   | contains(./NameLa, 'La1')|
      | DM1_US04_02        | tableLayer2| Checkfield(/Group/ Table/ Group(ComplexType))   | C5E3FD   | ./Base2/nameBase2 = 'BaseLa1'                | Checkfield(/Group/ Table/ Group(ComplexType)) | C5E3FD   | ./Base2/nameBase2 = 'BaseLa1'|     
      | DM1_US04_02        | TableA     | Checkrandom                                     | C5E3FD   | ./ID=6 or ./ID=9                               | Checkrandom     | C5E3FD   | ./ID=6 or ./ID=9   |
      | DM1_US04_02        | TableA     | Checkrandom                                     | C5E3FD   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()| Checkrandom     | C5E3FD   | ./ID= 6 and ./GroupA1/GroupA2/BooleanA = true()   |
   

 Scenario Outline: (US04-94, US04-96-> US04-98)- Check saved Table config when input InValid Label in legend, Color, Condition on Label colors
    Given open table configuration with configuration name "<configuration-name>" and table name "<table-name>"
    And input "<Label-in-legend>" and "<Color>" and "<Condition>" for Label Color
    Then error message "<error-message>" should be display
    And click save button
    Then error message "<error-message>" should be display under Labelcolors fields
    
    Examples: 
      | configuration-name | table-name | Label-in-legend                                 | Color    | Condition      |error-message                        |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | C5E3F    | ./NameLa = 'La'                                     |Input value '#C5E3F' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | aaaaa    | ./NameLa = 'La'                                     |Input value '#aaaaa' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | 1234(6   | ./NameLa = 'La'                                     |Input value '#1234(6' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |
      | DM1_US04_02        | tableLayer2| Check Invalid Color                             | $%^&*()  | ./NameLa = 'La'                                     |Input value '#$%^&*(' is not a valid hexadecimal color. It should start with '#' and be followed by 6 hexadecimal digits from '0' to 'F'. |

      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ParentA                                           | Invalid XPath predicate expression [/ParentA].   |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | floor(number)                                       | Invalid XPath predicate expression               | 
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | and                                                 | Invalid XPath predicate expression [and].        |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./Age = day-from-dateTime(/GroupA1/TimeA)           | Invalid XPath predicate expression               |
      #| DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NumberA=ceiling(${../NumberA2})                   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NumberA=ceiling(./NumberA2)                       | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID1 ='A9' and ./FKAB ='B9' and ./NumberA2 = 3.1   | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NameA>5                                           | An unknown predicate operator has been detected: >.  |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./NameA = A                                         | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID =abc                                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | starts-with(./NameA,A1)                             | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | contains(./NameA,A1)                                | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | contains(./NameA,1)                                 | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID1 = substring(./NameA,abc,2)                    | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | starts-with( ./ID2, 'A' )                           | Invalid XPath predicate expression               |
      | DM1_US04_02        | TableA     | Check Invalid Condition                         | FDC5DB   | ./ID2>5                                             | Invalid XPath predicate expression               |
    
 
                