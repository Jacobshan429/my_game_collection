Rails.application.routes.draw do
  resources :games do
    resources :players, :controller => :game_players
  end
  root :to => "games#index"
end
