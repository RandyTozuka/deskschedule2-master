Rails.application.routes.draw do
  devise_for :users
  root to: "workschedules#index"
  get 'workschedules/index'
  resources :workschedules do
    collection do
      get "admin_lastmonth"
      get "admin_nextmonth"
      get "nonadmin_lastmonth"
      get "nonadmin_nextmonth"
    end
  end
end
