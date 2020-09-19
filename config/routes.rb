Rails.application.routes.draw do
  post 'auth/login' => 'administrator_token#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'administrator', to: 'administrator#index'
  get 'profile', to: 'administrator#show'
  post 'signup', to: 'administrator#create'
  put 'administrator/update', to: 'administrator#update'
  delete 'administrator/delete', to: 'administrator#delete'

  get 'doctor', to: 'doctor#index'
  get 'hospital', to: 'hospitals#index'
  get 'hospitalAndDoctor', to: 'hospitals#show'
  post 'book/create', to: 'books#create'
  get 'book/show', to: 'books#show'
  get 'book/index/:id_doctor', to: 'books#index'
end
