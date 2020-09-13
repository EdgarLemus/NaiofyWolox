Feature: Listar los usuarios creados

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = '/users'
    * def getAutorizationLoguin = call read('Login.feature@FlujoExitoso')

  @FlujoExitoso
  Scenario: Lista de Usuario
    Given url (endPoint)
    And path (resource)
    And header Authorization = (getAutorizationLoguin).responseHeaders['Authorization'][0]
    When method Get
    Then status 200
    * def jsonBodyResposeValidate = read('../jsons/JsonUsuarioBodyResponseValidate.json')
    * print response
    And match each response.page[*] == jsonBodyResposeValidate
    * def jsonBodyResposeValidate = read('../jsons/JsonListaUsuarioBodyResponseValidate.json')
    And match response == jsonBodyResposeValidate