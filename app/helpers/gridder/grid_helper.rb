module Gridder

  module GridHelper

    def class_for(grid, name, &block)
      classheader_for(grid, name) +  ' {' + capture(&block) + '}'
    end
    
    def classheader_for(grid, name)
      namespace_for(grid) + ' .' + name
    end
    
    def namespace_for(grid)
      '.grid_' + grid.num_cols.to_s + '_' + grid.col_width.to_s + '_' + grid.gutter.to_s
    end 
  
  end

end