Rails.application.routes.draw do
  resources :projects do
    resources :project_environments, shallow: true do
      resources :credentials, shallow: true do
        resources :credential_keys
      end
    end
  end

  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
