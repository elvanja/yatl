class TasksController < InheritedResources::Base
  prepend_before_filter :get_auth_token
  before_filter :authenticate_user!
  respond_to :json

  def index
    #@tasks = Task.all_by_priority
    @tasks = current_user.tasks.all_by_priority
    index!
  end

  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    create! do |success, failure|
      success.json { render json: @task, status: :created, location: @task }
      failure.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end

  def update
    update! do |success, failure|
      success.json { head :no_content }
      failure.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end

  private

  # http://stackoverflow.com/questions/7399645/using-auth-token-from-request-headers-instead-from-post-put-parameters-with-rail
  def get_auth_token
    if auth_token = params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"]
      params[:auth_token] = auth_token
    end
  end
end
