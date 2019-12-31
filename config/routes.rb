Rails.application.routes.draw do
  namespace :api do
    resources :tweets do
      resources :comments
    end

    # resources :comments do
    #   resources :likes
    # end
  end
end
