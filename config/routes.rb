Rails.application.routes.draw do
    namespace :api do
        resources :accounts do
            resources :items
        end
    end
end
