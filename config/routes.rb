Gridder::Engine.routes.draw do

  resources :grids, :only => [:show], :constraints => {:id => /\d+\_\d+\_\d+/}

end
