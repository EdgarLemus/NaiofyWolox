Feature: Listado de fotos de un álbum

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def getResponseLoguin = call read('Login.feature@FlujoExitoso')
    * def getResponseListaAlbumes = call read('ListaAlbumes.feature')

  @FlujoExitoso
  Scenario: Foto de album
    Given url (endPoint)
    And path '/albums/getResponseListaAlbumes.response[3].id/photos'
    And header Authorization = (getResponseLoguin).responseHeaders['Authorization'][0]
    When method Get
    Then status 200
    * def jsonBodyResposeValidate = read('../jsons/JsonListaFotosAlbumesBodyResponseValidate.json')
    And match each response == jsonBodyResposeValidate