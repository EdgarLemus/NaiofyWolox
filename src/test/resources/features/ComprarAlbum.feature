Feature: Comprar Album

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def getResponseLoguin = call read('Login.feature@FlujoExitoso')

  Scenario Outline: <Escenario>
    * def jsonParametroComprarAlbum =
      """
      {
      }
      """
    Given url (endPoint)
    And path 'albums/'+<idAlbum>
    And request jsonParametroComprarAlbum
    And header Authorization = (getResponseLoguin).responseHeaders['Authorization'][0]
    When method Post
    Then status <status>
    * print response
    Examples:
      |Escenario|idAlbum|status|
      |Comprar album existente|  10   |201|

  Scenario Outline: <Escenario>
    * def jsonParametroComprarAlbum =
      """
      {
      }
      """
    Given url (endPoint)
    And path 'albums/'+<idAlbum>
    And request jsonParametroComprarAlbum
    And header Authorization = (getResponseLoguin).responseHeaders['Authorization'][0]
    When method Post
    Then status <status>
    * def jsonBodyResposeValidate = read('../jsons/JsonErrorBodyResponseValidate.json')
    And match response == jsonBodyResposeValidate
    * print response
    Examples:
      |Escenario|idAlbum|status|
      |Comprar album no existente|  999   |404|
      |Comprar album que ya fue comprado|  6   |422|