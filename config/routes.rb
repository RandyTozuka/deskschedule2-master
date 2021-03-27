Rails.application.routes.draw do
  devise_for :users
  root to: "workschedules#index"
  get 'workschedules/index'
  resources :workschedules, only: [:index] do
    collection do
      get "admin_lastmonth"
      get "admin_nextmonth"
    end
  end
end
