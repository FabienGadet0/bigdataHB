Rails.application.routes.draw do
  get '/',
   to: 'main#index'
  post '/' => "main#upload"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
