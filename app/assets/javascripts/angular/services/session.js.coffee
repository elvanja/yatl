App.factory 'Session', ['$log', '$cookieStore', '$http', ($log, $cookieStore, $http) ->

  isAuthenticated = ->
    getAuthToken()?

  login = (email, password, successHandler) ->
    transform = (data) ->
      $.param(data)

    $http.post( '/api/tokens.json', {email: email, password: password}, {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      transformRequest: transform
    })
      .success (response) ->
        $cookieStore.put('_yatl_auth_token', response["token"])
        successHandler() if angular.isFunction successHandler
      .error (error) ->
        $cookieStore.remove('_yatl_auth_token')
        alert "Could not verify your credentials, please try again"

  logout = ->
    $cookieStore.remove('_yatl_auth_token')
    getAuthToken()

  getAuthToken = ->
    $cookieStore.get('_yatl_auth_token')

  {
    login,
    logout,
    isAuthenticated,
    getAuthToken
  }
]
