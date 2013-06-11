App.controller 'TasksController', ['$scope', '$location', 'Task', ($scope, $location, Task) ->
  # Attributes accessible on the view
  $scope.selectedTask = null

  # Gather the tasks and set the selected one to the first on success
  $scope.tasks = Task.query()
  $scope.tasks
    .then ->
      $scope.selectedTask = $scope.tasks[0]
    , (error) ->
      alert "Error trying to get tasks (" + error + ")"

  # Determines if given task is selected or not
  $scope.isActive = (task) ->
    'active' if $scope.selectedTask == task

  # Set the selected task to the one which was clicked
  $scope.showTask = (task) ->
    $scope.selectedTask = task

  # Add task
  $scope.addTask = ->
    task = new Task {description: $scope.taskDescription, priority: -1}
    task.create()
      .then ->
        $scope.tasks = Task.query()
        $scope.showTask task
      , (error) ->
        alert "Error trying to save a new task (" + error + ")"

  # Update task
  $scope.updateTask = ->
    task = new Task {id: $scope.selectedTask.id, description: $scope.taskDescription, priority: $scope.taskPriority}
    task.update()
      .then ->
        $scope.tasks = Task.query()
        $scope.showTask task
      , (error) ->
        alert "Error trying to update existing task (" + error + ")"

  # Delete task
  $scope.deleteTask = ->
    $scope.selectedTask.delete()
      .then ->
        $scope.tasks = Task.query()
        $scope.showTask $scope.tasks[0]
      , (error) ->
        alert "Error trying to delete existing task (" + error + ")"
]
