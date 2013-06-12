App.factory 'Task', ['$http', 'railsResourceFactory', ($http, railsResourceFactory) ->
  # http://stackoverflow.com/questions/7399645/using-auth-token-from-request-headers-instead-from-post-put-parameters-with-rail
  $http.defaults.headers.common['X-AUTH-TOKEN'] = 'WBMn7tg7JwKrNacDxT8i'
  railsResourceFactory {url: '/api/tasks', name: 'task'}
]
