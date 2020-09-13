Feature: Listar los usuarios creados

  Background:
    * def endPoint = 'https://nodejs-qa-training.herokuapp.com/'
    * def resource = '/users'
    * def getAutorizationLoguin = call read('Login.feature@FlujoExitoso')

  Scenario: Loguin Exitoso
    * def json =
    """
    {
      "page": [],
      "count": "#number",
      "limit": "#number",
      "offset": "#number",
      "total_pages": "#number",
      "total_count": "#number",
      "previous_page": "#number",
      "current_page": "#number",
      "next_page": "#number",
      "previous_page_link": "##string",
      "current_page_link": "##string",
      "next_page_link": "##string",
      "first_page_link": "##string",
      "last_page_link": "##string",
      "n_page_link": "##string"
    }
    """

    #Given url (endPoint)
    #And path (resource)
    #And header Authorization = (getAutorizationLoguin).responseHeaders['Authorization'][0]
    #When method Get
    #Then status 200
    #* def jsonBodyResposeValidate = read('../jsons/JsonUsuarioBodyResponseValidate.json')
    #* print response
    #And match each response.page[*] == jsonBodyResposeValidate
    #* def usuarios = response.page[*] == jsonBodyResposeValidate
    #* def jsonBodyResposeValidate = read('../jsons/JsonListaUsuarioBodyResponseValidate.json')
    #And match response == jsonBodyResposeValidate