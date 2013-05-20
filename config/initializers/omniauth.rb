Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'CzlyxdAbon29DPpemVRnQ', 'Uv1L8E1jjrfZDf5UIIFF3RuKjx6U6f5kv5aGfEfZg'
  provider :facebook, 'FACEBOOK_KEY', 'FACEBOOK_SECRET'
  provider :identity, model: Client,
    on_login: lambda { |env|
      SessionsController.action(:new).call(env)
    },
    on_registration: lambda { |env|
      ClientsController.action(:new).call(env)
    },
    on_failed_registration: lambda { |env|
      ClientsController.action(:new).call(env)
    }
end

OmniAuth.config.on_failure = lambda { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
