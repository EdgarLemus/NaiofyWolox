Feature: Listar los usuarios creados

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = '/users'
    * def getAutorizationLoguin = call read('Login.feature@FlujoExitoso')

  Scenario: Loguin Exitoso
    Given url (endPoint)
    And path (resource)
    And header Authorization = (getAutorizationLoguin).responseHeaders['Authorization'][0]
    When method Get
    Then status 200
    * def jsonBodyResposeValidate = read('../jsons/JsonListaUsuarioBodyResponseValidate.json')
    * print response
    And match response == jsonBodyResposeValidate