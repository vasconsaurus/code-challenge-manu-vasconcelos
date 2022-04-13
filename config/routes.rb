Rails.application.routes.draw do
  root 'cycles#index'
  resources :invitations, only: %i[new create]
end
