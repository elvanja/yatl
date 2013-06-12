App.controller 'TasksController', ['$log', '$http', '$scope', '$location', 'Task', 'Session', ($log, $http, $scope, $location, Task, Session) ->
  # Attributes accessible on the view
  $scope.selectedTask = null
  $scope.tasks = null

  # Gather the tasks and select given one or the first in the list
  $scope.loadTasks = (task) ->
    $scope.tasks = Task.query()
    $scope.tasks
      .then (results) ->
        task_to_show = results[0]
        if task
          matching_tasks = results.filter (from_results) ->
            from_results.id == task.id
          task_to_show = matching_tasks[0]
        $scope.showTask task_to_show
      , (error) ->
        alert "Error trying to get tasks (" + error + ")"

  # Determines if given task is selected or not
  $scope.isActive = (task) ->
    'active' if $scope.selectedTask == task

  # Set the selected task to the one which was clicked
  # Remember bind values for edit form
  $scope.showTask = (task) ->
    $scope.selectedTask = task
    $scope.taskDescription = $scope.selectedTask.description
    $scope.taskPriority = $scope.selectedTask.priority

  # Add task
  $scope.addTask = ->
    task = new Task {description: $scope.newTaskDescription, priority: -1}
    task.create()
      .then (result) ->
        $scope.loadTasks(result)
      , (error) ->
        alert "Error trying to save a new task (" + error + ")"

  # Update task
  $scope.updateTask = ->
    task = new Task {id: $scope.selectedTask.id, description: $scope.taskDescription, priority: $scope.taskPriority}
    task.update()
      .then (result) ->
        $scope.loadTasks(task)
      , (error) ->
        alert "Error trying to update existing task (" + error + ")"

  # Delete task
  $scope.deleteTask = ->
    $scope.selectedTask.delete()
      .then ->
        $scope.loadTasks()
      , (error) ->
        alert "Error trying to delete existing task (" + error + ")"

  $scope.isAuthenticated = ->
    Session.isAuthenticated()

  # Login
  $scope.login = ->
    Session.login($scope.email, $scope.password, loginSuccessHandler)

  loginSuccessHandler = ->
    init()

  # Logout
  $scope.logout = ->
    Session.logout()
    init()

  # Signup
  $scope.signup = ->
    $log.info "about to trigger signup"
    Session.signup($scope.email, $scope.password, $scope.passwordConfirmation, signupSuccessHandler)

  signupSuccessHandler = ->
    alert "Signup successfull !!!"

  # Initialization
  init = ->
    $http.defaults.headers.common['X-AUTH-TOKEN'] = Session.getAuthToken()
    if $scope.isAuthenticated()
      $scope.loadTasks()
    else
      $scope.tasks = null

  init()
]
