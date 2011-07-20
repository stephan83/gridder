Rails.application.routes.draw do
  mount_at = Gridder::Engine.config.mount_at

  match (mount_at + '/grid-:num_cols-:col_width-:gutter.css') => 'gridder/grid#grid', :constraints => {
    :num_cols => /\d+/,
    :col_width => /\d+/,
    :gutter => /\d+/
  }
end
