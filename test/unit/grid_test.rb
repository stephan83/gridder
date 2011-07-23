require 'test_helper'

class GridTest < ActiveSupport::TestCase

  test 'load Grid model correctly' do
    assert_kind_of Gridder::Grid, Gridder::Grid.new(12, 60, 20)
  end

  test 'handle accessors correctly' do
    grid = Gridder::Grid.new(12, 60, 20)
    assert_same 12, grid.num_cols
    assert_same 60, grid.col_width
    assert_same 20, grid.gutter
    grid.num_cols = 10
    assert_same 10, grid.num_cols
    grid.col_width = 80
    assert_same 80, grid.col_width
    grid.gutter = 30
    assert_same 30, grid.gutter
  end

  test 'validate correctly' do
    assert Gridder::Grid.new(12, 60, 20).valid?
    assert Gridder::Grid.new(false, false, false).invalid?
    assert Gridder::Grid.new(12, false, false).invalid?
    assert Gridder::Grid.new(12, 60, false).invalid?
    assert Gridder::Grid.new(12, 60, 'test').invalid?
    assert Gridder::Grid.new(12, 60.5, 20).invalid?
    assert Gridder::Grid.new(-12, 60, 20).invalid?
    assert Gridder::Grid.new(0, 60, 20).invalid?
    assert Gridder::Grid.new(1, 60, 20).valid?
    assert Gridder::Grid.new(12, -60, 20).invalid?
    assert Gridder::Grid.new(12, 0, 20).invalid?
    assert Gridder::Grid.new(12, 1, 20).valid?
    assert Gridder::Grid.new(12, 60, -20).invalid?
    assert Gridder::Grid.new(12, 60, 0).valid?
    assert Gridder::Grid.new(12, 60, 11).invalid?
    assert Gridder::Grid.new(12, 200, 100).invalid?
    assert Gridder::Grid.new(200, 60, 20).invalid?
  end

end