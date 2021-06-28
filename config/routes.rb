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
  ## 開発環境用letter_opener
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
