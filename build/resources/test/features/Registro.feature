Feature: Registro de usuario

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = '/users/'

  @FlujoExitoso
  Scenario Outline: Loguin Exitoso
    * def jsonParametroRegistroUsuario =
      """
      {
        "email": "jperez@wolox.com.ar",
        "password": "candidatoWolox2020",
        "firstName": "Juan",
        "lastName": "Perez"
      }
      """
    Given url (endPoint)
    And path (resource)
    And request jsonParametroRegistroUsuario
    When method Post
    Then status 201
    * print response
    Examples:
    |Escenario|email|password|firstname|lastname|status|
    |Registro Exitoso|jose.bermudez@wolox.com.ar|candidatoWolox2020|Jose Antonio|Bermudez|201|
    |Registro Fallido correo no valido|jose.bermudez@google.com.ar|candidatoWolox2020|Jose Antonio|Bermudez|201|
    |Registro Fallido contraseña no valida|jose.bermudez@wolox.com.ar|12345fg|Jose Antonio|Bermudez|201|
    |Registro Exitoso|jose.bermudez@wolox.com.ar|candidatoWolox2020|Jose Antonio|Bermudez|201|
    |Registro Fallido usuario existente|jose.bermudez@wolox.com.ar|candidatoWolox2020|Jose Antonio|Bermudez|422|
