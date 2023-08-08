Rails.application.routes.draw do
  root "pages#home"
  # Defines the about path route ("/about")
  get "/about", to: "pages#about"
  # Defines the contact path route ("/contact")
  get "/contact", to: "pages#contact"
end
