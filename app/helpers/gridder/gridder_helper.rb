module Gridder

  module GridderHelper
  
    def with_grid(num_cols, col_width, gutter, &block)
      raise ArgumentError, "Missing block" unless block_given?
      grid = Grid.new num_cols, col_width, gutter
      with_output_buffer { yield grid }
    end
  
  end

end