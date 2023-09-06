*** Settings ***
Resource    ../main.robot

*** Keywords ***
Como usuario eu acesso o Organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Fechar o navegador
    Close Browser