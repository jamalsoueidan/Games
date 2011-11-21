Games::Application.routes.draw do
  
  get "admin/login"

  resources :games, :only => [:index]

  get '/admin' => "admin#index"
  
  namespace :admin do
    resources :users, :except => [:new, :create]
    resources :games
  end
  
  resources :users, :only => [:new, :create, :show]
  
  get '/games/:id/match/:name' => "games#match", :as => 'match_game'
  
  get '/authorize' => "authorize#index"
  
  match "/auth/:provider/callback" => "authorize#create"
  match '/auth/failure' => 'authorize#failure'

  get '/home' => "main#index", :as => 'en_home'
  get '/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9%20%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9' => "main#index", :as => 'ar_home'

  get '/help' => "main#help", :as => 'en_help'
  get '/%D9%85%D8%B3%D8%A7%D8%B9%D8%AF%D8%A9' => "main#help", :as => 'ar_help'
  get "/%d9%85%d8%b3%d8%a7%d8%b9%d8%af%d8%a9" => "main#help", :as => "fix_ar_help"

  get '/about_us' => "main#about_us", :as => 'en_about_us'
  get '/%D9%85%D9%86%20%D9%86%D8%AD%D9%86' => "main#about_us", :as => 'ar_about_us'
  get '/%d9%85%d9%86%20%d9%86%d8%ad%d9%86' => "main#about_us", :as => "fix_ar_about_us"

  get "/logout" => "authorize#destroy", :as => 'en_logout'
  get '/%D8%AE%D8%B1%D9%88%D8%AC' => "authorize#destroy", :as => 'ar_logout'
  get  "/%d8%ae%d8%b1%d9%88%d8%ac" => "authorize#destroy", :as => 'fix_ar_logout'

  get "games" => "games#index", :as => "en_games"
  get "%D8%A3%D9%84%D8%B9%D8%A7%D8%A8" => "games#index", :as => "ar_games"
  get "/%d8%a3%d9%84%d8%b9%d8%a7%d8%a8" => "games#index", :as => "fix_ar_games";

  get "/games/:name" => "games#show", :as => "en_game"
  get "/%D8%A3%D9%84%D8%B9%D8%A7%D8%A8/:name" => "games#show", :as => "ar_game"
  get "/%d8%a3%d9%84%d8%b9%d8%a7%d8%a8/:name" => "games#show", :as => "fix_ar_game"

  root :to => "main#index"
end