module ROM
  module Sharding
    module Plugin

      # @api private
      def self.apply(environment, options = {})
        environment.include(ContainerMethods)
      end

      module ContainerMethods
        def shard(gateway)
          Shard.new(self, gateway)
        end
      end
    end
  end
end

ROM.plugins do
  register :sharding, ROM::Sharding::Plugin, type: :environment
end
