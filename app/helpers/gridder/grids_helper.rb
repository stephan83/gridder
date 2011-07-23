module Gridder
  module GridsHelper

    include Engine.routes.url_helpers

    # Executes a block passing a grid for the given arguments
    def with_grid(num_cols, col_width, gutter, &block)
      raise ArgumentError, "Missing block" unless block_given?
      grid = Grid.new num_cols, col_width, gutter
      yield grid
    end

    # Returns the path to a grid for the fiven arguments
    def grid_stylesheet(num_cols, col_width, gutter)
      grid_path num_cols.to_s + '_' + col_width.to_s + '_' + gutter.to_s
    end

  end
end