class UsersController < InheritedResources::Base
  respond_to :json

  def create
    create! do |success, failure|
      success.json { render json: @user, status: :created, location: @user }
      failure.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def update
    update! do |success, failure|
      success.json { head :no_content }
      failure.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end
