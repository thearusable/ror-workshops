Rails.application.routes.draw do
  devise_for :users

  root to: "visitors#index"

  resources :teachers do
  	get :subjects
  end

  resources :students do
    get :subjects
  end

  match '/reports/subjects' => 'reports#subjects', as: 'report_subjects', via: [:get]

end
