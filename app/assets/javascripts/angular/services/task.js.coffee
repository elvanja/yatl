App.factory 'Task', ['$http', 'railsResourceFactory', 'Session', ($http, railsResourceFactory, Session) ->
  # http://stackoverflow.com/questions/7399645/using-auth-token-from-request-headers-instead-from-post-put-parameters-with-rail
  $http.defaults.headers.common['X-AUTH-TOKEN'] = Session.getAuthToken()
  railsResourceFactory {url: '/api/tasks', name: 'task'}
]
