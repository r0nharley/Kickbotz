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
    Shipping First Name
    Shipping Last Name
    Shipping Address 1
    Shipping City
    Shipping State
    Shipping Postal Code
    Shipping Phone Number
    Shipping Email
    Credit Card Number Entry
    Credit Card Exp Month
    Credit Card Exp Year
    Credit Card Code



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
    #[Arguments]  ${F_Name}
    ${FName}=  Set Variable  %{F_NAME}
    Click Element  ${FirstName}
    Input Text  ${FirstName}   ${FName}

Shipping Last Name
    [Tags]  Last Name Entry
    #[Arguments]  ${L_Name}
    ${LName}=  Set Variable  %{L_NAME}
    Click Element  ${LastName}
    Input Text  ${LastName}   ${LName}
    Capture Page Screenshot

Shipping Address 1
    [Tags]  Address Entry
    #[Arguments]  ${Addy_1}
    ${Addy1}=  Set Variable  %{ADDY_1}
    Click Element  ${Address1}
    Input Text  ${Address1}  ${Addy1}
    Click Element  ${Address1}

Shipping City
    [Tags]  City Entry
    #[Arguments]  ${Cty}
    ${Cty1}=  Set Variable  %{CTY}
    Click Element  ${City}
    Input Text  ${City}   ${Cty1}

Shipping State
    [Tags]  State Entry
    #[Arguments]  ${State_S}   ${State_F}
    ${State1}=  Set Variable  //div[@data-value='%{STATE_S}'][contains(.,'%{STATE_F}')]
    Click Element   ${StateDropdown}
    Click Element   ${State1}

Shipping Postal Code
    [Tags]  Postal Code Entry
    #[Arguments]  ${Zip}
    ${Zip_Code}=  Set Variable  %{ZIP}
    Click Element   ${PostalCode}
    Input Text  ${PostalCode}  ${Zip_Code}

Shipping Phone Number
    [Tags]  Phone Number Entry
    #[Arguments]  ${Phone}
    ${PhoneNum}=  Set Variable  %{PHONE}
    Click Element  ${PhoneNumber}
    Input Text  ${PhoneNumber}   ${PhoneNum}

Shipping Email
    [Tags]  Email Entry
    #[Arguments]  ${EmailA}
    ${EmailAddress}=  Set Variable  %{EMAILA}
    Click Element  ${Email}
    Input Text  ${Email}  ${EmailAddress}
    Click Element  ${ReviewPayButton}


Credit Card Number Entry
    [Tags]  Credit Card Page Confirmation
    #[Arguments]  ${CCN}
    ${CCN1}=  Set Variable  %{CCN}
    Wait Until Element is Visible  ${PaymentMethodHeader}
    Click Element  ${CreditCardNumber}
    Input Text  ${CreditCardNumber}  ${CCN1}


Credit Card Exp Month
    [Tags]  CC Expiration Month
    #[Arguments]  ${MNum}  ${MNumFull}
    ${MSelection}=  Set Variable  //div[@data-value='%{MNUM}'][contains(.,'%{MNUMFULL}')]
    Click Element  ${CCExMonthDropdown}
    Click Element  ${MSelection}


Credit Card Exp Year
    [Tags]  CC Expiration Year
    #[Arguments]   ${ExYear}
    ${ExYear1}=  Set Variable  //div[@data-value='%{EXYEAR}']
    Click Element  ${CCExpYearDropdown}
    Click Element  ${ExYear1}
    Click Element  ${CCCVNumber}

Credit Card Code
    [Tags]  CC CVN Code
    #[Arguments]  ${CCVN}
    ${CCVN1}=  Set Variable  %{CCVN}
    Input Text  ${CCCVNumber}   ${CCVN1}
    Click Element  ${PlaceOrderButton}
    Sleep  3
    Capture Page Screenshot
