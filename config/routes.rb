Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :create, :new] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
