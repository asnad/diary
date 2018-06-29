Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: "pages#home"
  get 'pages/home'
  devise_for :users
end
