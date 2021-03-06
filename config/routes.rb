Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'sessions' }

  resources :tests, only: %i[index show] do
    resources :questions, shallow: true, only: :show do
      resources :answers, shallow: true, only: :show
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
    resources :gists, only: :create
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index 
      end
    end
    resources :gists, only: :index
    resources :badges 
  end

  resources :badges, only: %i[index show]

  get 'user/:user_id/badges(.:format)', to: 'user/badges#index', as: "guru_badges"

end
