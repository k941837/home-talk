Rails.application.routes.draw do
  devise_for :users
  root to: "expenses#toppage"
  resources :expenses do
    collection do
      get 'search_expense'
    end
  end
  resources :incomes
  resources :users
end

