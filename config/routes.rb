Rails.application.routes.draw do
    apipie
    namespace :api do
        resources :accounts do
            resources :items
        end
    end
end
