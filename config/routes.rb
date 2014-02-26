BrazillianCookery::Application.routes.draw do
  resources :chefs
  resources :recipes
  get '/', => 'static_pages#home'
end
