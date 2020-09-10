Feature: Loguin en la apicacion

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = '/users/sessions'

    @FlujoExitoso
    Scenario: Loguin Exitoso
      * def jsonParametroLoguin =
      """
      {
        email: 'admin@wolox.com.ar',
        password: 'candidatoWolox2020'
      }
      """
      Given url (endPoint)
      And path (resource)
      And request jsonParametroLoguin
      When method Post
      Then status 200
      * def jsonBodyResposeValidate = read('../jsons/JsonLoguinBodyResponseValidate.json')
      And match response == jsonBodyResposeValidate
      * def jsonHeaderResposeValidate = read('../jsons/JsonHeaderResponseValidate.json')
      And match responseHeaders == jsonHeaderResposeValidate
      * print response

  @FlujoFallido
  Scenario: Loguin Exitoso
    * def jsonParametroLoguin =
      """
      {
        email: 'correoerroneo@wolox.com.ar',
        password: 'candidatoWolox2020'
      }
      """
    Given url (endPoint)
    And path (resource)
    And request jsonParametroLoguin
    When method Post
    Then status 401
    * def jsonBodyResposeValidate = read('../jsons/JsonErrorBodyResponseValidate.json')
    And match response == jsonBodyResposeValidate
    * print response