*** Settings ***
Resource    ../main.robot

*** Variables ***   
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{SELEC_TIMES}  
...       //option[contains(.,'Programação')]
...       //option[contains(.,'Front-End')]
...       //option[contains(.,'Data Science')]
...       //option[contains(.,'Devops')]
...       //option[contains(.,'UX e Design')]
...       //option[contains(.,'Mobile')]
...       //option[contains(.,'Inovação')]
${COLABORADOR}            class:colaborador

#Mensagens erros
${MSG_ERRO_NOME}          id:form-nome-erro
${MSG_ERRO_CARGO}          id:form-cargo-erro
${MSG_ERRO_TIME}          id:form-times-erro

*** Keywords ***
#Preenchimento correto
Dado que preencho os campos do furmulário corretamente
#Variaveis:
    ${NOME}    FakerLibrary.First Name  
    ${CARGO}   FakerLibrary.Job
    ${IMG}    FakerLibrary.Image Url    width=100  height=100
#Teste:                
    Input Text                    ${CAMPO_NOME}                           ${NOME}
    Input Text                    ${CAMPO_CARGO}                          ${CARGO}
    Input Text                    ${CAMPO_IMAGEM}                         ${IMG}
    Click Element                 ${CAMPO_TIME}
    Click Element                 ${SELEC_TIMES}[0]

Quando eu clico no botão "Criar Card"
    Click Element                 ${BOTAO_CARD}

Então o card será criado dentro do time esperado
    Element Should Be Visible     ${COLABORADOR}

Então deve ser criado 3 cards no time selecionado
    FOR  ${i}    IN RANGE    1    15
        Dado que preencho os campos do furmulário corretamente
        Quando eu clico no botão "Criar Card" 
    END

Quando eu clico no botão "Criar Card" com os daods para cada um times
    FOR  ${indice}  ${time}    IN ENUMERATE    @{SELEC_TIMES}
        Dado que preencho os campos do furmulário corretamente
        Click Element    ${time}
        Quando eu clico no botão "Criar Card"
    END

#Preenchimento incorreto
Dado que não preencho os campos do furmulário corretamente
    Element Should Be Visible                               ${BOTAO_CARD}

Então o sistema deve exibir a mensagem de campo obrigatório
    Element Should Be Visible                               ${MSG_ERRO_NOME}
    Element Should Be Visible                               ${MSG_ERRO_CARGO}
    Element Should Be Visible                               ${MSG_ERRO_TIME}