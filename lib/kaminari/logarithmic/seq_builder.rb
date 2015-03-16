module Kaminari
  module Logarithmic
    class SeqBuilder

      def initialize(start, finish, options = {})
        @options = options.reverse_merge!(strategy: :even)
        build_strategy(start, finish)
      end

      def build
        @strategy.build
      end

      private

      def build_strategy(start, finish)
        klass = "Kaminari::Logarithmic::Strategies::#{@options[:strategy].to_s.classify}Strategy".constantize
        @strategy = klass.new(start, finish)
      end
    end
  end
end
