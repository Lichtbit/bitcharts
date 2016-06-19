Bitcharts::Engine.routes.draw do
  resources :days, only: :show
end
