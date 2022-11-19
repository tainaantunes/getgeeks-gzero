*Settings*
Documentation       Session route

*Keyword*
POST Session

    [Arguments]     ${payload}

    ${response}     POST
    ...        ${API_USERS}/sessions       
    ...        json=${payload}     
    ...        expected_status=any

    [return]        ${response}
