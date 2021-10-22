*** Settings ***
Documentation       Neste arquivo estarão presentes todos exercícios de automação do curso

*** Variables ***
# Minha primeira variável do tipo dicionário
&{PESSOA}
...          nome=Helder
...          sobrenome=Fernandes
...          idade=28
...          cpf=12345678911
...          profissão=analista de teste
...          carro=Sentra

@{FRUTAS}   Banana      Abacaxi     Uva     Limão       Pera


*** Test Cases ***
Cenario: Imprimindo 6 informações de uma pessoa
     Log To Console         ${PESSOA.nome}
     Log To Console         ${PESSOA.sobrenome}
     Log To Console         ${PESSOA.idade}
     Log To Console         ${PESSOA.cpf}
     Log To Console         ${PESSOA.profissão}
     Log To Console         ${PESSOA.carro}

Cenario: Imprimindo uma lista de frutas
    [Tags]             LISTA 
    Log To Console      ${FRUTAS}
    Log To Console      ${FRUTAS[2]}
    Log To Console      ${FRUTAS[1]}


Cenario: Somando dois numeros
    [Tags]              SOMAR
    Somar dois numeros  10  10

Cenario
    [Tags]              Digitalizar
    Digitalizar um email  Guilherme  Augusto  28

Cenario: Contando de 0 a 9
    [Tags]      CONTAR
    FOR     ${COUNT}    IN RANGE    0   9
    Log To Console      ${COUNT}
    END

Cenario: Percorrendo lista de fruta
    [Tags]          FRUTAS
    Percorrer itens de uma lista

Cenario: Estar no numero
    [Tags]          ESTAR
    Estar de 0 a 10  

Cenario paises
    [Tags]          ESTOU
    Estar no pais


Cenario tomando Decisões
    [Tags]      TOMAR
    Tomar Decisões





*** Keywords ***
Somar dois numeros
        [Arguments]     ${NUM_A}    ${NUM_B}    
        ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}   
        [Return]        ${SOMA}

Digitalizar um email
        [Arguments]     ${nome}     ${sobrenome}    ${idade}
        ${RESULTADO}         Catenate    ${nome}_${sobrenome}_${idade}@robot.com
        [Return]        ${RESULTADO}
        
Contar de 0 a 9
    Estar de 0 a 10


Percorrer itens de uma lista
    @{FRUTAS}       Create list        Banana      Uva     Abacaxi
    FOR     ${fruta}    IN      @{FRUTAS}
    Log To Console      ${fruta}
    END

Estar de 0 a 10
    @{NUMERO}       CREATE LIST     0   1   2   3   4   5   6   7   8   9   10
    FOR     ${numero}   IN      @{NUMERO}   
    ${RESULTADO}        Catenate    Estou no número:${NUMERO}
    Log To Console      ${RESULTADO}
    END


Estar no pais



Tomar Decisões
    FOR     ${COUNT}    IN RANGE    0   9
        IF  '${COUNT}'=='5'
            Log To Console  Estou no numero ${COUNT}
    ELSE IF     '${COUNT}'=='8'
        Log To Console  Estou no numero ${COUNT} 
    ELSE
        Log To Console  este não é o número 5 ou número 8
            END  
                END


