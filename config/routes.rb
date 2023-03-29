Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/authors', to: 'author#index'
  get '/authors/:id', to: 'author#get'
  post '/authors', to: 'author#create'
  put '/authors/:id', to: 'author#update'
  delete '/authors/:id', to: 'author#destroy'

  get '/books', to: 'book#index'
  get '/books/:id', to: 'book#get'
  post '/books', to: 'book#create'
  put '/books/:id', to: 'book#update'
  delete '/books/:id', to: 'book#destroy'
end
