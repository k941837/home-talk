Rails.application.routes.draw do
  devise_for :users
  root to: "expenses#toppage"
  resources :expenses
  resources :incomes
  resources :users
end

