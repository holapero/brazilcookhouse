BrazillianCookery::Application.routes.draw do
  resources :chefs
  resources :recipes
  root 'static_pages#home'
  get 'about' => 'static_pages#about'

end
