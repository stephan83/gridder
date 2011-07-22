Rails.application.routes.draw do

  get "grid/index"

  mount Gridder::Engine => "/gridder"
end
