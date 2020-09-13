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
    * def f = Java.type('utils.ValidateFieldToField').validateJsonFieldToField(jsonParametroRegistroUsuario)
    ##* match jsonParametroRegistroUsuario !contains {'firstName': '#? _ = #number'}
    #* match jsonParametroRegistroUsuario.email contains "@wolox.com.ar"
    #* match jsonParametroRegistroUsuario !contains {'firstName': '#? _ != ['1','2','3']'}

    #Given url (endPoint)
    #And path (resource)
    #And request jsonParametroRegistroUsuario
    #When method Post
    #Then status 201
    #* print response
    Examples:
    |Escenario|email|password|firstname|lastname|status|
    |Registro Exitoso|jose.bermudez@wolox.com.ar|candidatoWolox2020|Jose Antonio|Bermudez|201|
