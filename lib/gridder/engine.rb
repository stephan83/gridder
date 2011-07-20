module Gridder
  class Engine < Rails::Engine
    #isolate_namespace Gridder
    config.mount_at = '/gridder'
  end
end
