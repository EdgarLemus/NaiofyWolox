Feature: Registro de usuario

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = '/users/'

  @FlujoExitoso
  Scenario Outline: <Escenario>
    * def jsonParametroRegistroUsuario =
      """
      {
        "email": "<email>",
        "password": "<password>",
        "firstName": "<firstname>",
        "lastName": "<lastname>"
      }
      """
    Given url (endPoint)
    And path (resource)
    And request jsonParametroRegistroUsuario
    When method Post
    Then status <status>
    * print response
    Examples:
    |Escenario|email|password|firstname|lastname|status|
    |Registro Exitoso|jose.bermuda@wolox.com.ar|candidatoWolox2020|Jose Antonio|Bermudez|201|

  @FlujoFallido
  Scenario Outline: <Escenario>
    * def jsonParametroRegistroUsuario =
      """
      {
        "email": "<email>",
        "password": "<password>",
        "firstName": "<firstname>",
        "lastName": "<lastname>"
      }
      """
    Given url (endPoint)
    And path (resource)
    And request jsonParametroRegistroUsuario
    When method Post
    Then status <status>
    * def jsonBodyResposeValidate = read('../jsons/JsonErrorBodyResponseValidate.json')
    And match response == jsonBodyResposeValidate
    * print response
    Examples:
      |Escenario|email|password|firstname|lastname|status|
      |Registro Fallido - Usuario existente|jose.bermudez@wolox.com.ar|candidatoWolox2020|Jose Antonio|Bermudez|422|
      |Registro Fallido - Estructura Password incorrecta - Tamaño|jose.bermudez@wolox.com.ar|candidat|Jose Antonio|Bermudez|422|
      |Registro Fallido - Estructura Password incorrecta - Formato|jose.bermudez@wolox.com.ar|candidatoWolox|Jose Antonio|Bermudez|422|

