require 'active_model'

module Gridder
  class Grid
    include ActiveModel::Validations
  
    validates_presence_of :num_cols, :col_width, :gutter
    validates_numericality_of :num_cols, :only_integer => true, :greater_than => 0, :less_than_or_equal_to => Engine.config.max_cols
    validates_numericality_of :col_width, :only_integer => true, :greater_than => 0
    validates_numericality_of :gutter, :only_integer => true, :greater_than_or_equal_to => 0, :even => true
    validates_numericality_of :width, :only_integer => true, :less_than_or_equal_to => Engine.config.max_width
  
    attr_accessor :num_cols, :col_width, :gutter
    
    def initialize(num_cols, col_width, gutter)
      @num_cols, @col_width, @gutter = num_cols, col_width, gutter
    end
    
    # Return total width of the grid
    def width
      begin
        (@num_cols.to_i) * (@col_width.to_i +  @gutter.to_i)
      rescue
        0
      end
    end
    
    # Casts attributes to integers
    def intefy!
      @num_cols = @num_cols.to_i
      @col_width = @col_width.to_i
      @gutter = @gutter.to_i
    end
    
    # Returns a 'namespace' unique to this grid
    def namespace
      'grid_' + @num_cols.to_s + '_' + @col_width.to_s + '_' + @gutter.to_s
    end
    
    # Return CSS classname of a container
    def container
      namespace + '_container'
    end
    
    # Returns CSS classname of a col
    def col(num)
      namespace + '_col_' + num.to_s
    end
    
    # Returns CSS classname of a prefix
    def prefix(num)
      namespace + '_prefix_' + num.to_s
    end
    
    # Returns CSS classname of a suffix
    def suffix(num)
      namespace + '_suffix_' + num.to_s
    end
    
    # Returns CSS classname of a push
    def push(num)
      namespace + '_push_' + num.to_s
    end
    
    # Returns CSS classname of a pull
    def pull(num)
      namespace + '_pull_' + num.to_s
    end
    
    # Returns alpha CSS classname
    def alpha
      namespace + '_alpha'
    end
    
    # Returns omega CSS classname
    def omega
      namespace + '_omega'
    end
    
    # Returns clear CSS classname
    def clear
      namespace + '_clear'
    end
    
  end
end
