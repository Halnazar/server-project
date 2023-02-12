Rails.application.routes.draw do

  default_url_options :host => "localhost"

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  ActiveAdmin.routes(self)

  get 'vacancies/index'

  root 'candidates#index'

  resources :positions
  resources :criteria
  resources :candidates
  resources :vacancies
  resources :position_criterium_scores
  resources :candidate_criterium_scores

  get "home/statistics"


end
