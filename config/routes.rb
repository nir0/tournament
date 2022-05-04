Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'games#index'
  patch :prepare_division_a, to: 'games#prepare_division_a'
  patch :prepare_division_b, to: 'games#prepare_division_b'
  patch :playoff, to: 'games#playoff'
  resources :teams, except: [:show, :destroy]

  # additional actions
  patch :drop_data, to: 'games#drop_data'
  patch :seed, to: 'games#seed'

end
