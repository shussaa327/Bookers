Rails.application.routes.draw do
	get "/" => "books#top"
  resources :books
end
