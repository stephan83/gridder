#app/models/grid.rb

require 'active_model'

class Grid
  include ActiveModel::Validations

  validates_presence_of :num_cols, :col_width, :gutter
  validates_numericality_of :num_cols, :only_integer => true, :greater_than => 0
  validates_numericality_of :col_width, :only_integer => true, :greater_than => 0
  validates_numericality_of :gutter, :only_integer => true, :greater_than_or_equal_to => 0

  attr_accessor :num_cols, :col_width, :gutter
  
  def initialize(num_cols, col_width, gutter)
    @num_cols, @col_width, @gutter = num_cols, col_width, gutter
  end
end