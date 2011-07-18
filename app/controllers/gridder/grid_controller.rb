#app/controllers/grid_controller.rb

module Gridder
  class GridController < ApplicationController
    
    caches_page :grid
   
    def grid
      self.response.headers['Content-Type'] = 'text/css'
      
      @grid = Gridder::Grid.new(params[:num_cols], params[:col_width], params[:gutter])
      
      if @grid.valid?
        @grid.intefy!
        render :layout => false, :view => 'gridder/grid'
      else
        render :text => '/* invalid dimensions */'
      end
    end
    
  end
end
