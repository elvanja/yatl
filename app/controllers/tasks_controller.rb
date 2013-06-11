class TasksController < ApplicationController
  inherit_resources
  respond_to :html, :json

  def index
    @tasks = Task.all_by_priority
    index!
  end

  def create
    create! do |success, failure|
      success.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
      success.json { head :no_content }
      failure.html { render action: "new" }
      failure.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
      success.json { head :no_content }
      failure.html { render action: "edit" }
      failure.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end
end
