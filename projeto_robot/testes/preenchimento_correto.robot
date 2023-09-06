*** Settings ***
Resource         ../resources/shared/setup_teardown.robot
Test Setup       Como usuario eu acesso o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Veririficar se ao preencher os campos do formulário corretamente são inseridos na lista e se um novo card é criado no time esperado
    Dado que preencho os campos do furmulário corretamente
    Quando eu clico no botão "Criar Card"
    Então o card será criado dentro do time esperado

Veririficar se é possível criar mais de um card se preenchermos os campos corretamente
    Dado que preencho os campos do furmulário corretamente
    Quando eu clico no botão "Criar Card"
    Então deve ser criado 3 cards no time selecionado

Verificar a criação de um card para cada time disponível ao preencher os campos corretamente
    Dado que preencho os campos do furmulário corretamente
    Quando eu clico no botão "Criar Card" com os daods para cada um times
    Então o card será criado dentro do time esperado
    