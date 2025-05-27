class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    auth = request.env["omniauth.auth"]
    
    # Log the exact auth data we receive
    Rails.logger.info "GitHub OAuth Data received:"
    Rails.logger.info "Email: #{auth.info.email}"
    Rails.logger.info "UID: #{auth.uid}"
    Rails.logger.info "Provider: #{auth.provider}"
    
    @user = User.from_omniauth(auth)

    if @user.persisted?
      # Update user info if needed
      @user.update(
        name: auth.info.name,
        image: auth.info.image
      ) if @user.name != auth.info.name || @user.image != auth.info.image

      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
    else
      Rails.logger.error "Failed to persist user:"
      Rails.logger.error @user.errors.full_messages
      redirect_to root_path, alert: "Could not sign in with GitHub: #{@user.errors.full_messages.join(", ")}"
    end
  rescue => e
    # Debug logging for exceptions
    Rails.logger.error "GitHub OAuth Error: #{e.class} - #{e.message}"
    Rails.logger.error e.backtrace.join("\n")
    redirect_to root_path, alert: "Authentication error: #{e.message}"
  end

  def failure
    Rails.logger.error "OmniAuth Failure:"
    Rails.logger.error "Message: #{failure_message}"
    Rails.logger.error "Strategy: #{failed_strategy&.name}"
    redirect_to root_path, alert: "GitHub authentication failed: #{failure_message}"
  end
end 