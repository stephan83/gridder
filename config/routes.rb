Gridder::Engine.routes.draw do
  
  #match 'grids/:num_cols-:col_width-:gutter.css' => 'grid#grid', :constraints => {
  #  :num_cols => /\d+/,
  #  :col_width => /\d+/,
  #  :gutter => /\d+/
  #}
  
  resources :grids, :only => [:show], :constraints => {:id => /\d+\-\d+\-\d+/}
  
end
