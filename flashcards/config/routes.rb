Rails.application.routes.draw do
  get "/decks" => "decks#index"
  get "/decks/new" => "decks#new"
  get "/decks/:id" => "decks#show", as: :deck
  post "/decks" => "decks#create"
  get "/decks/:id/edit" => "decks#edit"
  match("/decks/:id", { :via => :patch, :to  => "decks#update" })
  delete "/decks/:id" => "decks#destroy"
end
