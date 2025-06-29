Rails.application.routes.draw do
  root "articles#index"
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "/articles", to: "articles#index"
end
