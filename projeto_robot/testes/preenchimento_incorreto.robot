*** Settings ***
Resource         ../resources/shared/setup_teardown.robot
Test Setup       Como usuario eu acesso o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Veririficar se quando um campo obrigatório não for preenchido corretamente o sistema exibe a mensagem de campo obrigatório

    Dado que não preencho os campos do furmulário corretamente
    Quando eu clico no botão "Criar Card"
    Então o sistema deve exibir a mensagem de campo obrigatório