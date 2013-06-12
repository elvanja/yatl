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
        alert "Could not verify your credentials, please try again"

  logout = ->
    $cookieStore.remove('_yatl_auth_token')
    getAuthToken()

  signup = (email, password, passwordConfirmation, successHandler) ->
    transform = (data) ->
      $.param(data)

    $http.post('/users.json', {user: {email: email, password: password, password_confirmation: passwordConfirmation}}, {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      transformRequest: transform
    })
      .success (response) ->
        successHandler() if angular.isFunction successHandler
      .error (error) ->
        alert "Could not sign you up, please try again \n" + error["error_messages"]

  #https://github.com/karlfreeman/angular-devise/blob/master/app/assets/javascripts/angular-devise/services/session.js
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
