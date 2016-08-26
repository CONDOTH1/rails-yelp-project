Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "restaurants#index"
  resources :restaurants do
    resources :reviews
  end

  resources :restaurants, shallow: true do
    resources :reviews do
      resources :endorsements
    end
  end

#   devise_scope :user do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
