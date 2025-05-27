class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    # First try to find by provider and uid
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    return user if user.present?

    # If not found, try to find by email
    user = User.find_by(email: auth.info.email)
    if user.present?
      # If user exists but doesn't have provider info, update it
      if user.provider.nil? && user.uid.nil?
        user.update(provider: auth.provider, uid: auth.uid)
        return user
      else
        # User exists but has different provider info
        return nil
      end
    end

    # Create new user if none found
    User.create(
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20],
      name: auth.info.name,
      image: auth.info.image
    )
  end

  # Allow OAuth users to update their account without password
  def update_without_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    result = update(params, *options)
    clean_up_passwords
    result
  end
end
