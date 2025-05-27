Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], scope: 'user:email'
end

# Disable CSRF protection for OmniAuth paths
OmniAuth.config.allowed_request_methods = [:post, :get] 