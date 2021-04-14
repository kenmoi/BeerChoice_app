Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get   'users/:id/mypage'  => 'users#mypage', as: 'mypage'
  get   'users/:id/cancel'  => 'users#cancel', as: 'cancel'
  patch 'users/:id/quit'     => 'users#quit', as: 'quit'
  resources :users, only:[:show, :edit, :update, :destroy]
end
