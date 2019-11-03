module Ppu
  class Engine < ::Rails::Engine
    isolate_namespace Ppu
    config.generators.api_only = true
  end
end
