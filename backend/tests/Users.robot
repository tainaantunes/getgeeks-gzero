*Settings*
Documentation       Users route test suite


Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Add new user

    ${user}      Factory New User
    Remove User  ${user}
   
    ${response}         POST User        ${user}

    Status Should Be    201              ${response}

    #Validação do ID se será maior que zero
    ${user_id}         Set Variable         ${response.json()}[id]
    Should Be True     ${user_id} > 0


Get user data

    ${user}     Factory Get User
    POST User   ${user}

    ${token}            Get token   ${user}
    ${response}         GET User    ${token}
    Status Should Be    200         ${response}

    #Validando campos strings
    Should Be Equal As strings      ${user}[name]       ${response.json()}[name]
    Should Be Equal As strings      ${user}[email]     ${response.json()}[email]

    #No Phyton para validar nulo é Nome dai usa string para comparar como string
    Should Be Equal As strings      None        ${response.json()}[whatsapp]
    Should Be Equal As strings      None        ${response.json()}[avatar]
    #No Phyton para validar boleano, mais fácil usar string para comparar
    Should Be Equal As strings      False       ${response.json()}[is_geek]


Remove user
    # Dado que existe um usuário no sistema
    ${user}     Factory Remove User
    POST User   ${user}

    # E Tenho um token desse usuário
    ${token}            Get token       ${user}

    # Quando faço uma solicitação de remoção na rota/users
    ${response}         DELETE User     ${token}

    # Entao deve retornar o status code 204 (no content)
    Status Should Be    204             ${response}

    # E ao fazer uma requisição GET, deve retornar o status code 404 (not found)
    ${response}         GET User    ${token}
    Status Should Be    404         ${response}


Update a user
    
    # Dado que existe um usuário no sistema
    ${user}     Factory Update User
    POST User   ${user}[before]

    # E Tenho um token desse usuário
    ${token}            Get token       ${user}[before]

    # Quando faço uma solicitação de alteração na rota/users
    ${response}         PUT User  ${token}   ${user}[after]
    
    # Entao deve retornar o status code 200
    Status Should Be    200         ${response}

    # E ao fazer uma requisição GET, deve retornar os dados atualizados
    ${response}         GET User    ${token}
    
    Should Be Equal As strings      ${user}[after][name]             ${response.json()}[name]
    Should Be Equal As strings      ${user}[after][email]            ${response.json()}[email]
    Should Be Equal As strings      ${user}[after][whatsapp]         ${response.json()}[whatsapp]
    Should Be Equal As strings      ${user}[after][avatar]           ${response.json()}[avatar]
    Should Be Equal As strings      False                            ${response.json()}[is_geek]
