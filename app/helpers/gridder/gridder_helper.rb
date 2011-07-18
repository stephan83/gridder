module Gridder

  module GridderHelper
  
    def with_grid(num_cols, col_width, gutter, &block)
      grid = Grid.new num_cols, col_width, gutter
      capture(&block, grid)
    end
  
  end

end