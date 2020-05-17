Rails.application.routes.draw do
  root to: 'videos#index'
  #get 'videos/upload'
  #post 'videos/:id/edit' => 'videos#update'
  #post 'videos/search' => 'videos#search'
  #get 'videos/search' => 'videos#search'
  #get 'videos/upload/import' => 'videos#import'

  resources :videos do
    member do
      get :edit
      post :edit, action: :update
    end

    collection do
      get :upload
      post :search
      get :search
      get :import
      get :tags
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
