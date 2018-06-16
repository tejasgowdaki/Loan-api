Rails.application.routes.draw do
  resources :accounts, defaults: { format: :json }
  resources :members, defaults: { format: :json }
end
