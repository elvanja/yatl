class UsersController < InheritedResources::Base
  respond_to :html, :json

  def create
    create! do |success, failure|
      success.html { redirect_to users_url, notice: 'User was successfully added.' }
      success.json { render json: @user, status: :created, location: @user }
      failure.html { render action: "new" }
      failure.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to users_url, notice: 'User was successfully updated.' }
      success.json { head :no_content }
      failure.html { render action: "edit" }
      failure.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end
