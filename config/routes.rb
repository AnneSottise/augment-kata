Rails.application.routes.draw do
  root 'workers#index'

	resources :workers, :shifts
end
