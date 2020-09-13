Feature: Invalidar Sesiones

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = 'users/sessions/invalidate_all'
    * def getResponseLoguin = call read('Login.feature@FlujoExitoso')

  @FlujoExitoso
  Scenario: Invalidar sesion
    * def jsonParametroInvalidarSesion =
      """
      {
      }
      """
    Given url (endPoint)
    And path (resource)
    And request jsonParametroInvalidarSesion
    And header Authorization = (getResponseLoguin).responseHeaders['Authorization'][0]
    When method Post
    Then status 200
    * print response