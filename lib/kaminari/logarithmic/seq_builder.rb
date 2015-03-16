module Kaminari
  module Logarithmic
    class SeqBuilder
      DEFAULT_STRATEGY = :even

      def initialize(start, finish, options = {})
        @options = options
        build_strategy(start, finish)
      end

      def build
        @strategy.build
      end

      private

      def build_strategy(start, finish)
        code = @options[:strategy] || DEFAULT_STRATEGY
        klass = "Kaminari::Logarithmic::Strategies::#{code.to_s.camelize}Strategy".constantize
        @strategy = klass.new(start, finish)
      end
    end
  end
end
