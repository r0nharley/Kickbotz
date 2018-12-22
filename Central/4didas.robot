*** Settings ***
Library  SeleniumLibrary

Resource   ${EXECDIR}/Central/Common.robot


*** Variables ***

${ShoeURL}                  https://www.adidas.com/us/ultraboost-shoes/F36153.html
${SelectSize}               //div[@class='gl-dropdown__select label dropdown-select'][contains(.,'Select size')]
${AddToBag}                 //button[@type='submit'][contains(.,'Add To Bag')]
${AddToBagSuccess}          //h5[@class='gl-modal__title gl-heading--m'][contains(.,'Successfully added to bag!')]
${CheckoutButton}           //a[@class='gl-cta gl-cta--secondary gl-cta--full-width'][contains(.,'Checkout')]
${ShippingAddressHeader}    //h2[@class='checkout-title'][contains(.,'Shipping Address')]
${FirstName}                //input[contains(@id,'firstName')]
${LastName}                 //input[contains(@id,'lastName')]
${Address1}                 //input[contains(@id,'address1')]
${City}                     //input[contains(@id,'city')]
${StateDropdown}            (//div[contains(.,'Select State')])[13]
${StateSelection}           //div[@data-value='FL'][contains(.,'Florida')]
${PostalCode}               //input[contains(@id,'postalCode')]
${PhoneNumber}              //input[contains(@id,'phone')]
${Email}                    //input[contains(@id,'emailAddress')]
${ReviewPayButton}          //button[contains(.,'Review and Pay')]
${PaymentMethodHeader}      //h2[contains(.,'Payment Method')]
${CreditCardNumber}         //input[@type='text'][contains(@id,'number')]
${CCExMonthDropdown}        //div[@data-default-value='Month']
${CCExMonthSelection}       //div[@data-value='01'][contains(.,'01-January')]
${CCExpYearDropdown}        //div[@data-default-value='Year']
${CCExpYearSelection}       //div[@data-value='2020']
${CCCVNumber}               //input[@type='text'][contains(@id,'cvn')]
${PlaceOrderButton}         (//button[@type='submit'][contains(.,'Place My Order')])[2]







*** Keywords ***

MensWorkflow
    Navigate to Page
    Select Shoe Size
    Add to Bag
    Shipping Page Confirmation
    Shipping First Name         Webster
    Shipping Last Name          Jabro
    Shipping Address 1          101 Jefferson Ave
    Shipping City               Miami
    Shipping State              FL  Florida
    Shipping Postal Code        33132
    Shipping Phone Number       212-222-2222
    Shipping Email              WebsterJ@Gmail.com
    Credit Card Number Entry    4111 1111 1111 1111
    Credit Card Exp Month       01  01-January
    Credit Card Exp Year        2020
    Credit Card Code            345



Navigate to Page
    [Tags]  Go to shoe url
    go to   ${ShoeURL}
    maximize browser window
    Capture Page Screenshot

Select Shoe Size
    [Tags]  Select Shoe Size
    #[Arguments]  %{SHOE_SIZE}
    ${EnterSize}=   Set Variable  //div[@class='gl-square-list__cta'][contains(.,'%{SHOE_SIZE}')]
    Wait Until Element Is Visible  ${SelectSize}  10
    Click Element  ${SelectSize}
    Capture Page Screenshot
    Click Element  ${EnterSize}
    Capture Page Screenshot

Add to Bag
    [Tags]  Add your bag
    Click Element  ${AddToBag}
    Wait Until Element Is Visible  ${AddToBagSuccess}
    Capture Page Screenshot
    Click Element  ${CheckoutButton}
    Capture Page Screenshot

Shipping Page Confirmation
    [Tags]  Add Shipping Info
    Wait Until Element Is Visible  ${ShippingAddressHeader}
    Capture Page Screenshot

Shipping First Name
    [Tags]  First Name Entry
    [Arguments]  ${F_Name}
    ${FName}=  Set Variable  ${F_Name}
    Click Element  ${FirstName}
    Input Text  ${FirstName}   ${FName}

Shipping Last Name
    [Tags]  Last Name Entry
    [Arguments]  ${L_Name}
    ${LName}=  Set Variable  ${L_Name}
    Click Element  ${LastName}
    Input Text  ${LastName}   ${LName}
    Capture Page Screenshot

Shipping Address 1
    [Tags]  Address Entry
    [Arguments]  ${Addy_1}
    ${Addy1}=  Set Variable  ${Addy_1}
    Click Element  ${Address1}
    Input Text  ${Address1}  ${Addy1}
    Click Element  ${Address1}

Shipping City
    [Tags]  City Entry
    [Arguments]  ${Cty}
    ${Cty1}=  Set Variable  ${Cty}
    Click Element  ${City}
    Input Text  ${City}   ${Cty1}

Shipping State
    [Tags]  State Entry
    [Arguments]  ${State_S}   ${State_F}
    ${State1}=  Set Variable  //div[@data-value='${State_S}'][contains(.,'${State_F}')]
    Click Element   ${StateDropdown}
    Click Element   ${State1}

Shipping Postal Code
    [Tags]  Postal Code Entry
    [Arguments]  ${Zip}
    ${Zip_Code}=  Set Variable  ${Zip}
    Click Element   ${PostalCode}
    Input Text  ${PostalCode}  ${Zip_Code}

Shipping Phone Number
    [Tags]  Phone Number Entry
    [Arguments]  ${Phone}
    ${PhoneNum}=  Set Variable  ${Phone}
    Click Element  ${PhoneNumber}
    Input Text  ${PhoneNumber}   ${PhoneNum}

Shipping Email
    [Tags]  Email Entry
    [Arguments]  ${EmailA}
    ${EmailAddress}=  Set Variable  ${EmailA}
    Click Element  ${Email}
    Input Text  ${Email}  ${EmailAddress}
    Click Element  ${ReviewPayButton}


Credit Card Number Entry
    [Tags]  Credit Card Page Confirmation
    [Arguments]  ${CCN}
    ${CCN1}=  Set Variable  ${CCN}
    Wait Until Element is Visible  ${PaymentMethodHeader}
    Click Element  ${CreditCardNumber}
    Input Text  ${CreditCardNumber}  ${CCN1}


Credit Card Exp Month
    [Tags]  CC Expiration Month
    [Arguments]  ${MNum}  ${MNumFull}
    ${MSelection}=  Set Variable  //div[@data-value='${MNum}'][contains(.,'${MNumFull}')]
    Click Element  ${CCExMonthDropdown}
    Click Element  ${MSelection}


Credit Card Exp Year
    [Tags]  CC Expiration Year
    [Arguments]   ${ExYear}
    ${ExYear1}=  Set Variable  //div[@data-value='${ExYear}']
    Click Element  ${CCExpYearDropdown}
    Click Element  ${ExYear1}
    Click Element  ${CCCVNumber}

Credit Card Code
    [Tags]  CC CVN Code
    [Arguments]  ${CCVN}
    ${CCVN1}=  Set Variable  ${CCVN}
    Input Text  ${CCCVNumber}   ${CCVN1}
    Click Element  ${PlaceOrderButton}
    Sleep  3
    Capture Page Screenshot
