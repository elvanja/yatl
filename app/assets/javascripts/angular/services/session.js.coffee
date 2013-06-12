App.factory 'Session', ['$log', '$cookieStore', '$http', ($log, $cookieStore, $http) ->

  isAuthenticated = ->
    getAuthToken()?

  login = (email, password, successHandler) ->
    transform = (data) ->
      $.param(data)

    $http.post('/api/tokens.json', {email: email, password: password}, {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      transformRequest: transform
    })
      .success (response) ->
        $cookieStore.put('_yatl_auth_token', response["token"])
        successHandler() if angular.isFunction successHandler
      .error (error) ->
        $cookieStore.remove('_yatl_auth_token')
        alert "Could not verify your credentials, please try again (" + error + ")"

  logout = ->
    $cookieStore.remove('_yatl_auth_token')
    getAuthToken()

  signup = (email, password, passwordConfirmation, successHandler) ->
    transform = (data) ->
      $.param(data)

    $log.info "about to signup remotely"
    $http.get('/users/sign_up.json', {email: email, password: password, password_confirmation: passwordConfirmation}, {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      transformRequest: transform
    })
      .success (response) ->
        alert "response: " + response
#        successHandler() if angular.isFunction successHandler
      .error (error) ->
        alert "Could not sign you up, please try again (" + error + ")"

  getAuthToken = ->
    $cookieStore.get('_yatl_auth_token')

  {
    login,
    logout,
    signup,
    isAuthenticated,
    getAuthToken
  }
]
