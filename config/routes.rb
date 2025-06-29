Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "students#index"
  get "search", to: "students#search"
  get "report", to: "students#report"
  get "top10", to: "students#top10"
end
