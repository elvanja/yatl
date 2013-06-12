class RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        render :status => 200, :json => {:success => true}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        render :status => 200, :json => {:success => true}
      end
    else
      clean_up_passwords resource
      # http://www.norbauer.com/rails-consulting/notes/displaying-activerecord-validation-errors-from-ajax-requests.html
      error_messages = resource.errors.full_messages.collect { |error| '> ' + error }.join("\n")
      render :status => 401, :json => {:success => false, :error_messages => error_messages}
    end
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    # angular is doing the login on its own
    #sign_in(resource_name, resource)
  end
end