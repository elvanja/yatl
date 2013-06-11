#App.factory 'Task', ['$resource', ($resource) ->
#  $resource '/api/tasks/:id', id: '@id'
#]
App.factory 'Task', ['railsResourceFactory', (railsResourceFactory) ->
  railsResourceFactory {url: '/api/tasks', name: 'task'}
]
