Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: "pages#home"
  get 'pages/home'
  devise_for :users
  devise_for :administrators , {
    path: :admin,
    controllers: {
        passwords: "active_admin/devise/passwords",
        confirmations: 'active_admin/devise/confirmations',
        sessions: "active_admin/devise/sessions"
    },
    path_names: { sign_in: 'login', sign_out: "logout"},
    sign_out_via: [*::Devise.sign_out_via, ActiveAdmin.application.logout_link_method].uniq
  }
end
