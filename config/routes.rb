# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/authors', to: 'author#index'
  get '/authors/:id', to: 'author#get'
  get '/authors/:id/books', to: 'author#books'
  post '/authors', to: 'author#create'
  put '/authors/:id', to: 'author#update'
  delete '/authors/:id', to: 'author#destroy'

  get '/books', to: 'book#index'
  get '/books/:id', to: 'book#get'
  get '/books/:id/authors', to: 'book#authors'
  post '/books', to: 'book#create'
  put '/books/:id', to: 'book#update'
  put '/books/:id/authors/:author_id', to: 'book#add_author'
  delete '/books/:id', to: 'book#destroy'
  delete '/books/:id/authors/:author_id', to: 'book#remove_author'

  post "/graphql", to: "graphql#execute"
end
