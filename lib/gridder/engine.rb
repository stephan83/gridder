module Gridder
  class Engine < Rails::Engine
    isolate_namespace Gridder
    config.max_cols = 64
    config.max_width = 2048
  end
end
