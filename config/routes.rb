Rails.application.routes.draw do

  get 'members/dashbord'    

   devise_for :users
   # devise_for :users, controllers: {
           # sessions: 'users/sessions'
         # }

     get 'checkout', to: 'checkouts#show'
     get 'checkout/success', to: 'checkouts#success'
     get 'billing', to: 'billing#show'

   root "homes#index"
end
