module Tire
  module Search

    class Aggregation
      def initialize(name, options={}, &block)
        @name = name
        @options = options
        @value = {}
        block.arity < 1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def to_json(options={})
        to_hash.to_json
      end

      def to_hash
        @value.update @options
        { @name => @value }
      end
    end
  end
end
