Rails.application.routes.draw do
  root 'loans#new'
  resources :loans
  resources :borrowers do
    member do 
      get :history
    end
  end
  resources :books do
    member do 
      get :history
    end
  end
end
