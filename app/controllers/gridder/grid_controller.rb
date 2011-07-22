module Gridder
  class GridController < ApplicationController
    
    caches_page :grid
    
    # Outputs CSS for a grid
    def grid
      self.response.headers['Content-Type'] = 'text/css'
      
      @grid = Gridder::Grid.new(params[:num_cols], params[:col_width], params[:gutter])
      
      if @grid.valid?
        @grid.intefy!
        render :layout => false, :view => 'grid/grid'
      else
        head :bad_request
      end
    end
    
  end
end