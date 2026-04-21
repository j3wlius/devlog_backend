Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # auth routes
  post "signup", to: "auth#register"
  post "login", to: "auth#login"
  # delete "logout", to: "auth#logout"
end
