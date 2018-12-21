*** Settings ***
Library  SeleniumLibrary

Resource   ${EXECDIR}/AutomatedTests/Kickbotz/Central/Common.robot


*** Variables ***

${ShoeURL}                  https://www.adidas.com/us/ultraboost-shoes/F36153.html
${SelectSize}               //div[@class='gl-dropdown__select label dropdown-select'][contains(.,'Select size')]
${EnterSize10.5}            //div[@class='gl-square-list__cta'][contains(.,'10.5')]
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
    go to   ${ShoeURL}
    maximize browser window
    Capture Page Screenshot
    Click Element  ${SelectSize}
    Capture Page Screenshot
    Click Element  ${EnterSize10.5}
    Capture Page Screenshot
    Click Element  ${AddToBag}
    Wait Until Element Is Visible  ${AddToBagSuccess}
    Capture Page Screenshot
    Click Element  ${CheckoutButton}
    Capture Page Screenshot
    Wait Until Element Is Visible  ${ShippingAddressHeader}
    Capture Page Screenshot
    Click Element  ${FirstName}
    Input Text  ${FirstName}   Hello
    Click Element  ${LastName}
    Input Text  ${LastName}   World
    Capture Page Screenshot
    Click Element  ${Address1}
    Input Text  ${Address1}  123 Main St
    Click Element  ${Address1}
    Click Element  ${City}
    Input Text  ${City}   Miami
    Click Element   ${StateDropdown}
    Click Element   ${StateSelection}
    Click Element   ${PostalCode}
    Input Text  ${PostalCode}  33132
    Click Element  ${PhoneNumber}
    Input Text  ${PhoneNumber}   212-222-2222
    Click Element  ${Email}
    Input Text  ${Email}  Hello@world.com
    Click Element  ${ReviewPayButton}
    Wait Until Element is Visible  ${PaymentMethodHeader}
    Click Element  ${CreditCardNumber}
    Input Text  ${CreditCardNumber}  4111 1111 1111 1111
    Click Element  ${CCExMonthDropdown}
    Click Element  ${CCExMonthSelection}
    Click Element  ${CCExpYearDropdown}
    Click Element  ${CCExpYearSelection}
    Click Element  ${CCCVNumber}
    Input Text  ${CCCVNumber}   123
    Click Element  ${PlaceOrderButton}
    Sleep  3
    Capture Page Screenshot
