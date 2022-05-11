*** Settings ***
Library           Selenium2Library

*** Variables ***
#createemail
${clicksignin}    xpath=//li[@class='active']/a[contains(.,'Sign in')]
${emailid}        id=email_create
${createaccount}    id=SubmitCreate
#register
${gender}         id=id_gender1
${firstname}      id=customer_firstname
${lastname}       id=customer_lastname
${passwd}         id=passwd
${setday}         xpath=//select[@id='days']
${setmounth}      xpath=//select[@id='months']
${setyears}       xpath = "//select[@id='years']
${ceklisnews}     id=newsletter
${ceklisoffers}    id=optin
${regist}         id=submitAccount
${registsucces}    xpath=//p[@class='alert alert-success']
#signinlogin
${email}          id=email
${passwd2}        id=passwd
${signin}         id=SubmitLogin
#login
${email2}         id=login_email
${passwd3}        id=login_passwd
${login}          xpath=//button[@id='SubmitLogin']/span[.='Sign in']
${vaili}          xpath=//*[@id="user_info_acc"]/span[1]
${Logout}         xpath=//*[@id="header"]/div[3]/div/div/div[7]/ul/li/ul/li[3]/a
#forgetpwd
${forgetpwd}      xpath=//a[.='Forgot your password?']
${emailakun}      xpath=//input[@id='email']
${butonretrieve}    xpath=//button[@class='btn button button-medium']
#akun
${myaccount}      xpath=//h1[.=\\\"My account\\\"]
${clickorderhistory}    xpath= //a[.='Order history and details']
${namaorder}      xpath=//*[@id="order-list"]/tbody/tr[1]/td[1]
${detailorder}    xpath=//*[@id="order-list"]/tbody/tr[1]/td[7]/a
${backaccount}    xpath=//*[@id="center_column"]/ul/li[1]/a
${mycredit}       xpath=//*[@id="center_column"]/div/div/ul/li[2]/a
${myaddress}      xpath=//*[@id="center_column"]/div/div/ul/li[3]/a
${mypersonal}     xpath=//*[@id="center_column"]/div/div/ul/li[4]/a
#errormsg
${errormsg1}      xpath=//ol//li
${errormsg2}      xpath=//div[@id='create_account_error']
#opsi
${opsiakun}       xpath=//button[@class='nav_toggle']
${interior}       xpath=//a[.='Interior']
${amenities}      xpath=//a[.='Amenities']
${room}           xpath=//a[.='Rooms']
${testimoni}      xpath=//a[.='Testimonials']
#checkin
${location}       xpath=//input[@id='hotel_location']
${indo}           xpath=//ul[@class='location_search_results_ul']
${slhotel}        xpath=//button[@id='id_hotel_button']
${Hprime}         xpath=//li[@class='search_result_li']
${checkin}        xpath=//input[@id='check_in_time']
${checkout}       xpath=//input[@id='check_out_time']
${nextdate}       xpath=//span[@class='ui-icon ui-icon-circle-triangle-e']
${prevdate}       xpath=//span[@class='ui-icon ui-icon-circle-triangle-w']
${jadwal}         xpath=//div[@id='ui-datepicker-div']
${28}             xpath=//a[.='28']
${30}             xpath=//a[.='30']
${btsearch}       xpath=//button[@id='search_room_submit']
#kategory
${rating}         xpath=//div[@id='filter_results']//div[@class='col-sm-12 lf_sub_cont']/div[1]//input[@value='5']
${hargafull}      css=.ui-slider-range
${hargaterpilih}    css=#filter_price_silder > a:nth-of-type(2)
${qty+}           xpath=//div[@id='category_data_cont']/div[3]//i[@class='icon-plus']
${qty-}           xpath=//div[@id='category_data_cont']/div[3]//i[@class='icon-minus']
${qytsatu}        id=cat_quantity_wanted_3
${boxinput}       xpath=//div[@id='category_data_cont']/div[3]//div[@class='qty_input_cont row margin-lr-0']
#popupShop
${btBook}         xpath=//div[@id='category_data_cont']/div[3]//span[.='Book Now']
${btShop}         xpath=//span[contains(.,'Continue shopping')]
${btChekout}      xpath=//span[contains(.,'Proceed to checkout')]
${closeshop}      xpath=//span[@class='cross']
${btprocees}      xpath=//div[@class='col-sm-12 proceed_btn_block']/a[contains(.,'Proceed')]
#save address
${klikloginnow}    xpath=//a[contains(.,'Login Now')]
${address}        xpath=//*[@id="address1"]
${zip}            xpath=//input[@id='postcode']
${city}           xpath=//input[@id='city']
${state}          id=id_state
${homephone}      xpath=//input[@id='phone']
${mobilephone}    xpath=//input[@id='phone_mobile']
${AddInfo}        xpath=//textarea[@id='other']
${assign}         xpath=//input[@id='alias']
${saveadd}        id=submitAddress
${myfirstadd}     xpath=//*[@id="center_column"]/div/div/ul/li[1]/a
${Bali}           xpath=//option[4]
#info payment
${butonproceed2}    xpath=//div[@id='collapse-guest-info']//a[contains(.,'Proceed')]
${ceklispay}      xpath=//input[@id='cgv']
${bankwire}       xpath=//a[contains(.,'Pay by bank wire (order processing will be longer)')]
${confirmorder}    xpath=//span[contains(.,'I confirm my order')]

*** Test Cases ***
NavigateURL
    [Documentation]    test is navigate URL http://qa.cilsy.id:8080/en/
    Open Browser    http://qa.cilsy.id:8080/en/    chrome

pagesignin
    Click Element    ${clicksignin}

Forget pwd
    Click Element    ${clicksignin}
    Click Element    ${forgetpwd}
    Input Text    ${emailakun}    lalili@gmail.com
    Click Button    ${butonretrieve}

Createaccountemail
    Click Element    ${clicksignin}
    Input Text    ${emailid}    vioyulita@gmail.com
    Click Button    ${createaccount}

Invalidemailcreate1
    Click Element    ${clicksignin}
    Input Text    ${emailid}    vailindah@gmail
    Click Button    ${createaccount}
    Sleep    1s
    Element Text Should Be    ${errormsg1}    Invalid email address.

Invalidemailcreate2
    Click Element    ${clicksignin}
    Input Text    ${emailid}    bukantuanputri@gmail.com
    Click Button    ${createaccount}
    Sleep    1s
    Element Text Should Be    ${errormsg2}    An account using this email address has already been registered. Please enter a valid password or request a new one.

Register
    Click Element    ${clicksignin}
    Input Text    ${emailid}    lalili@gmail.com
    Click Button    ${createaccount}
    Sleep    1s
    Select Radio Button    id_gender    1
    Wait Until Element Is Visible    ${firstname}
    Input Text    ${firstname}    vaili
    Input Text    ${lastname}    indah
    Input Text    ${passwd}    Lulu10
    Select From List By Value    //select[@id='days']    10
    Select From List By Value    //select[@id='months']    10
    Select Checkbox    ${ceklisnews}
    Select Checkbox    ${ceklisoffers}
    Click Button    ${regist}
    Sleep    1s
    Element Text Should Be    ${registsucces}    Your account has been created.

SignIn
    Click Element    ${clicksignin}
    Input Text    ${email}    nurindahvaili@gmail.com
    Input Text    ${passwd2}    vaili10
    Click Button    ${signin}

Logout
    Click Element    ${vaili}
    Click Element    ${Logout}

InvalidSignIn
    Click Element    ${clicksignin}
    Input Text    ${email}    bukantuanputri@gmail.com
    Input Text    ${passwd2}    lala10
    Click Button    ${signin}
    Element Text Should Be    ${errormsg1}    Authentication failed.

Orderhistory
    Click Element    ${clickorderhistory}
    Sleep    1s
    Click Element    ${namaorder}
    Sleep    3s
    Click Element    ${detailorder}
    Sleep    3s
    Click Element    ${backaccount}

MycreditSlips
    Click Element    ${mycredit}
    Sleep    1s
    Click Element    ${backaccount}

Myaddress
    Click Element    ${myaddress}
    Sleep    1s
    Click Element    ${backaccount}

Mypersonal
    Click Element    ${mypersonal}
    Sleep    1s
    Click Element    ${backaccount}

SeeAllOpsi
    Click Button    ${opsiakun}
    Click Element    ${interior}
    Click Element    ${amenities}
    Click Element    ${room}
    Click Element    ${testimoni}

CheckIn
    Input Text    ${location}    Indonesia
    Sleep    1s
    Click Element    ${indo}
    Click Element    ${slhotel}
    Sleep    1s
    Click Element    ${hprime}
    Click Element    ${checkin}
    Click Element    ${nextdate}
    Sleep    1s
    Click Element    ${prevdate}
    Click Element    ${28}
    Click Element    ${30}
    Click Button    ${btsearch}

Category
    Select Checkbox    ${rating}
    Sleep    1s
    Unselect Checkbox    ${rating}
    Drag And Drop    ${hargafull}    ${hargaterpilih}
    Sleep    1s
    Click Element    ${qty+}
    Click Element    ${qty-}
    #Clear Element Text    ${qytsatu}
    Click Element    ${btBook}
    Sleep    1s
    Click Element    ${closeshop}
    Click Element    ${btBook}
    Sleep    1s
    Click Element    ${btShop}
    Click Element    ${btChekout}
    Click Element    ${btprocees}
    Click Element    ${klikloginnow}

Login
    Input Text    ${email2}    nurindahvaili@gmail.com
    Input Text    ${passwd3}    vaili10
    Sleep    1s
    Click Element    ${login}
    Sleep    1s

GuestInfo
    #Wait Until Element Is Visible    ${butonproceed2}
    Click Element    ${butonproceed2}
    Sleep    1s
    Select Checkbox    ${ceklispay}
    Sleep    1s
    Click Element    ${bankwire}
    Sleep    1s
    Click Element    ${confirmorder}

AddAddress
    Click Element    ${myfirstadd}
    Input Text    ${address}    Jl. Patimura
    Input Text    ${zip}    14411
    Input Text    ${city}    Bali selatan
    Click Element    ${state}
    Click Element    ${Bali}
    Input Text    ${homephone}    021334455
    Input Text    ${mobilephone}    0813133131
    Input Text    ${AddInfo}    good
    Input Text    ${assign}    .Mrs handsome
    Click button    ${saveadd}

Paymentsuccess
    Sleep    1s
    Element Text Should Be    ${registsucces}    Your order on Sekolah QA is complete.
