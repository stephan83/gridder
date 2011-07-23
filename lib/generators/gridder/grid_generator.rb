module Gridder

  #require 'rails/generators'

  class GridGenerator < Rails::Generators::Base

    desc 'write a grid stylesheet to the app assets folder'

    source_root File.expand_path('../../../../app/views/gridder/grids', __FILE__)

    argument :num_cols, :type => :numeric, :default => 12, :desc => 'number of columns', :banner => 'number of columns'
    argument :col_width, :type => :numeric, :default => 60, :desc => 'column width', :banner => 'column width'
    argument :gutter, :type => :numeric, :default => 20, :desc => 'gutter', :banner => 'gutter'

    def create_grid
      @grid = Gridder::Grid.new(num_cols, col_width, gutter)

      if @grid.valid?
        @grid.intefy!
        template 'show.erb', "app/assets/stylesheets/grid_#{num_cols}_#{col_width}_#{gutter}.css"
      else
        raise 'invalid grid' rescue puts 'the requested grid is not valid'
      end
    end

  end

end