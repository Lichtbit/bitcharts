Rails.application.routes.draw do

  mount Bitcharts::Engine => "/bitcharts"
  root to: 'application#show'
end
