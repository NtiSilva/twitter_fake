Rails.application.routes.draw do
    
    resources :usuarios
    resources :posts
   
    get 'sessions/new'
    
    get    'sign_in'   => 'sessions#new'
    post   'sign_in'   => 'sessions#create'
    delete 'sign_out'  => 'sessions#destroy'
    
    get    'api'       => 'posts#api' 
    
    root 'inicio#new'
end
