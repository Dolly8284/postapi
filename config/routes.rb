Rails.application.routes.draw do
   devise_for :users
   # devise_for :users, controllers: {
           # sessions: 'users/sessions'
         # }

     get 'checkouts', to: 'checkouts#show'
     get 'checkouts/success', to: 'checkouts#success'
     get 'billing', to: 'billing#show'
   root "homes#index"
end
