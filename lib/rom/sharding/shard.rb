require "delegator"

module ROM
  module Sharding
    class Shard < DelegateClass(ROM::Container)
      def initialize(container, gateway)
        super(container)

        @shard = case gateway
                 when Symbol
                   gateways[gateway]
                 else
                   gateway
                 end
      end

      def relation(name)
        relation = super
        klass = relation.klass

        klass.new(@shard.dataset(klass.dataset), relation.options)
      end
    end
  end
end
