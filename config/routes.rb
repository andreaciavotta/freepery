Rails.application.routes.draw do
  get 'notifications/link_through'
  resources :posts do
    resources :replies
    resources :likes
  end

  resources :conversations do
    resources :messages
  end


  resources :profiles

  get "search", to: "posts#search"
  get "geolocation", to: "posts#geolocation"
  get "faq", to: "public#faq"
  get "secret", to: "conversations#secret"
  get 'notifications', to: 'notifications#index'
  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through


  devise_for :accounts, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations'}
  root "public#main"
end
