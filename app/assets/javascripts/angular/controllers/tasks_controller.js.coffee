App.controller 'TasksController', ['$scope', 'Task', ($scope, Task) ->
  # Attributes accessible on the view
  $scope.selectedTask = null

  # Gather the tasks and set the selected one to the first on success
  $scope.tasks = Task.query ->
    $scope.selectedTask = $scope.tasks[0]

  # Determines if given task is selected or not
  $scope.isActive = (task) ->
    'active' if $scope.selectedTask == task

  # Set the selected task to the one which was clicked
  $scope.showTask = (task, row) ->
    $scope.selectedTask = task

  # Add task
  $scope.addTask = ->
    Task.save($scope.task)
    $scope.tasks.push({description: $scope.taskDescription, priority: -1})
    $scope.taskDescription = ''

#  # Add task
#  $scope.addTask = ->
#    task = $scope.selectedTask
#    task.create()
#      .then ->
#        $scope.browseToOverview()
#      , (error) ->
#        alert "Error trying to save a new task (" + error + ")"
]
