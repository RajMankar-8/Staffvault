Rails.application.routes.draw do

 root 'home#index'

 resources :workers
 resources :personals   
 resources :job_categorys
 resources :organizations, only: [:new, :create]

 devise_for :users, controllers: {
   sessions: 'users/sessions',
   passwords: 'users/passwords',
   registrations: 'users/registrations'
 }

end

