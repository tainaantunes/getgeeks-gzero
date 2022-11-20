*Settings*
Documentation       Geek route test suite


Resource    ${EXECDIR}/resources/Base.robot

*Test case*
Be a geek

   # Dado que temos um novo  usuário
    ${user}         Factory Be Geek
    Remove User     ${user}

    # E esse usuário é um cliente comum
    POST User       ${user}

    # E esse usuário possui um token válido
    ${token}        Get Token       ${user}

    # Quando faço uma requisição POST na rota /geeks
    ${response}      POST Geek      ${token}         ${user}[geek_profile]

    # Então deve retornar 201
    Status Should Be    201         ${response}

    # E ao consultar esse usuário na API Users
    ${response}     GET User        ${token}

    # Então o perfil geek deve ser retornado
   
    Should Be Equal As strings      ${user}[name]       ${response.json()}[name]
    Should Be Equal As strings      ${user}[email]      ${response.json()}[email]

    Should Be Equal As strings      ${user}[geek_profile][whatsapp]                     ${response.json()}[whatsapp]
    Should Be Equal As strings      ${user}[geek_profile][desc]                         ${response.json()}[desc]

    ${expectect_float}              Convert To Number                                   ${user}[geek_profile][cost] 
    ${got_float}                    Convert To Number                                   ${response.json()}[cost]        
    
    #Não precisa nessa caso colocar como as as strings, pois já convertamos em Number
    Should Be Equal                 ${expectect_float}                                  ${got_float}  
    Should Be Equal As strings      ${user}[geek_profile][printer_repair]               ${response.json()}[printer_repair]
    Should Be Equal As strings      ${user}[geek_profile][work]                         ${response.json()}[work] 
    Should Be Equal As strings      None                                                ${response.json()}[avatar]
    Should Be Equal As strings      True                                                ${response.json()}[is_geek]



Get Geek List
   [Tags]   temp

   ${data}     Factory Search For Geeks

   FOR      ${geek}  IN    @{data}[geeks]

         POST User   ${geek}
         ${token}    Get token      ${geek}

         POST Geek  ${token}     ${geek}[geek_profile]
   END

   POST User   ${data}[user]

   ${token}    Get token      ${data}[user]

   ${response}          GET Geeks      ${token}
   Status Should Be     200            ${response}

   #Validando a lista de Geeks
   ${total}          Get Length           ${response.json()}[Geeks]
   Should Be True    ${total} > 0
