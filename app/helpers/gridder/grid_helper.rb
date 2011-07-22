module Gridder
  module GridHelper
    
    # Executes a blog with a grid for the given arguments
    def with_grid(num_cols, col_width, gutter, &block)
      raise ArgumentError, "Missing block" unless block_given?
      grid = Grid.new num_cols, col_width, gutter
      yield grid
    end
    
  end
end