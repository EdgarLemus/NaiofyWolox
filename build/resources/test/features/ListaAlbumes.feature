Feature: Listado de albumes

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = '/albums'
    * def getAutorizationLoguin = call read('Login.feature@FlujoExitoso')

  Scenario: Listar albumes
    Given url (endPoint)
    And path (resource)
    And header Authorization = (getAutorizationLoguin).responseHeaders['Authorization'][0]
    When method Get
    Then status 200
    * def jsonBodyResposeValidate = read('../jsons/JsonListaAlbumBodyResponseValidate.json')
    And match each response == jsonBodyResposeValidate
    * print response