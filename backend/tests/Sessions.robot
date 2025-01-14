*Settings*
Documentation       Session route test suite


Resource    ${EXECDIR}/resources/Base.robot


*Variables*
&{inv_pass}         email=taina.antunes@matera.com      password=abc123  
&{inv_email}        email=taina.com.br                  password=Teste@123
&{email_404}        email=taina@404.com                 password=abc123  
&{empty_email}      email=${EMPTY}                      password=abc123
&{wo_email}         password=abc123
&{empty_pass}       email=taina.antunes@matera.com      password=${EMPTY}
&{wo_pass}          email=taina.antunes@matera.com      
     


*Test Cases*
User session

    # Dado que temos um usuário cadastrado
    ${payload}      Factory User Session    signup
    POST User       ${payload}     
      
    ${payload}      Factory User Session    login 

    #Quando faço uma requisição POST na rota /sessions
    ${response}     POST Session        ${payload} 

    #Então o status code deve ser 200
        Status Should Be    200                    ${response}

    # E deve gerar um token JWT
    ${size}             Get Length             ${response.json()}[token]
    Should Be True      ${size} > 0

    # E esse token deve expirar em 10 dias
    Should be Equal     10d                    ${response.json()}[expires_in]

Should Not Get token
    [Template]     Attempt Post Session 

    ${inv_pass}         401     Unauthorized
    ${inv_email}        400     Incorrect email
    ${email_404}        401     Unauthorized
    ${empty_email}      400     Required email        
    ${wo_email}         400     Required email
    ${empty_pass}       400     Required pass  
    ${wo_pass}          400     Required pass
     


*Keywords*
Attempt Post Session
    [Arguments]     ${payload}      ${status_code}      ${error_message}

    ${response}     POST Session    ${payload}

    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]
