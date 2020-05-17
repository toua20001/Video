Rails.application.routes.draw do
  get 'videos/upload'
  root to: 'videos#index'
  post 'videos/:id/edit' => 'videos#update'
  post 'videos/search' => 'videos#search'
  get 'videos/search' => 'videos#search'
  get 'videos/upload/import' => 'videos#import'
  resources :videos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
