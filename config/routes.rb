Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'tests#index'

  resources :tests do 
    resources :questions
  end
  
  get '/tests/:id/start', to: 'tests#start'

end
