Feature: Listado de álbumes comprados

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def getResponseLoguin = call read('Login.feature@FlujoExitoso')

  @FlujoExitoso
  Scenario: Listar albumes comprados por el usuario
    Given url (endPoint)
    And path '/users/'+getResponseLoguin.response.user_id+'/albums'
    And header Authorization = (getResponseLoguin).responseHeaders['Authorization'][0]
    When method Get
    Then status 200
    * def jsonBodyResposeValidate = read('../jsons/JsonListaAlbumesCompradosBodyResponseValidate.json')
    And match each response == jsonBodyResposeValidate
    * print response
