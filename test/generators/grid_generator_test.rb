require 'test_helper.rb'

class GridGeneratorTest < Rails::Generators::TestCase

  require File.expand_path('../../lib/generators/gridder/grid_generator', File.dirname(__FILE__))

  tests Gridder::GridGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'should generate stylesheet without args' do
    run_generator
    assert_file 'app/assets/stylesheets/grid_12_60_20.css'
  end

  test 'should generate stylesheet with valid args' do
    run_generator [10, 40, 40]
    assert_file 'app/assets/stylesheets/grid_10_40_40.css'
  end

  test 'should not generate stylesheet with invalid args' do
    run_generator [0, 40, 40]
    assert_no_file 'app/assets/stylesheets/grid_0_40_40.css'
  end

end