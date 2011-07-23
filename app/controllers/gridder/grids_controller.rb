module Gridder
  class GridsController < ApplicationController
    
    caches_page :grid
    
    # Outputs CSS for a grid
    def show
      @grid = Gridder::Grid.new(*params[:id].split('_'))
      
      if @grid.valid?
        @grid.intefy!
        respond_to do |format|
          format.css do
            self.response.headers['Content-Type'] = 'text/css'
            render :layout => false, :view => 'grid/grid'
          end
        end
      else
        head :not_acceptable
      end
    end
    
  end
end