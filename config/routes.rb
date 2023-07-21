Rails.application.routes.draw do

  post '/callback', to: 'message_callbacks#create'

end
