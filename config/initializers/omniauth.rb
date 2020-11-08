Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']#,
    # :scope => 'user,public_repo', 
    # :redirect_uri => ENV['GITHUB_REDIRECT']
end