require 'resque/server'
Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
  get "/applications", to: "applications#index"
  post "/applications", to: "applications#create"
  post "/applications/:application_token", to: "applications#update"
  get "/applications/:application_token/chats", to: "chat#index"
  post "/applications/:application_token/chats", to: "chat#create"

  post "/applications/:application_token/:chat_number/messages", to: "message#create"
  get "/applications/:application_token/:chat_number/messages", to: "message#index"
  get "/applications/:application_token/:chat_number/messages/search", to: "message#find_message"
end
