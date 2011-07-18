#app/models/grid.rb

require 'active_model'

module Gridder
  class Grid
    include ActiveModel::Validations
  
    validates_presence_of :num_cols, :col_width, :gutter
    validates_numericality_of :num_cols, :only_integer => true, :greater_than => 0, :less_than_or_equal_to => 64
    validates_numericality_of :col_width, :only_integer => true, :greater_than => 0
    validates_numericality_of :gutter, :only_integer => true, :greater_than_or_equal_to => 0, :even => true
    validates_numericality_of :width, :only_integer => true, :less_than_or_equal_to => 2048
  
    attr_accessor :num_cols, :col_width, :gutter
    
    def initialize(num_cols, col_width, gutter)
      @num_cols, @col_width, @gutter = num_cols, col_width, gutter
    end
    
    def width
      begin
        (@num_cols.to_i - 1) * (@col_width.to_i +  @gutter.to_i) + @col_width.to_i
      rescue
        0
      end
    end
    
    def intefy!
      @num_cols = @num_cols.to_i
      @col_width = @col_width.to_i
      @gutter = @gutter.to_i
    end
    
    def namespace
      'grid_' + @num_cols.to_s + '_' + @col_width.to_s + '_' + @gutter.to_s
    end
    
    def col(num)
      namespace + '_col_' + num.to_s
    end
    
    def prefix(num)
      namespace + '_prefix_' + num.to_s
    end
    
    def suffix(num)
      namespace + '_suffix_' + num.to_s
    end
    
    def push(num)
      namespace + '_push_' + num.to_s
    end
    
    def pull(num)
      namespace + '_pull_' + num.to_s
    end
    
    def alpha
      namespace + '_alpha'
    end
    
    def omega
      namespace + '_omega'
    end
    
    def clear
      namespace + '_clear'
    end
    
  end
end
