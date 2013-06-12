App.factory 'Session', ['$resource', ($resource) ->

  service = $resource '/api/tokens/:param', {},
    'login':
      method: 'POST'
    'logout':
      method: 'DELETE'

#  auth_token = 'WBMn7tg7JwKrNacDxT8i'
  auth_token = null

  authenticated = ->
    !!auth_token

  login = (newUser, resultHandler, errorHandler) ->
    service.login newUser
    , (result) ->
      user = result.user || {}
      user.authorized = result.authorized
      resultHandler(result) if angular.isFunction resultHandler
    , (error) ->
      errorHandler(error) if angular.isFunction errorHandler

  logout = (resultHandler, errorHandler) ->
    service.logout param: user.id
    , (result) ->
      user = {}
      resultHandler(result) if angular.isFunction resultHandler
    , (error) ->
      errorHandler(error) if angular.isFunction errorHandler

  getAuthToken = ->
    auth_token

  {
    login,
    logout,
    authenticated,
    getAuthToken
  }
]