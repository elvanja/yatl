App.factory 'Task', ['$resource', ($resource) ->
  $resource '/api/tasks/:id', id: '@id'
]
