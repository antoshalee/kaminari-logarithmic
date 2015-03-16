module Kaminari
  module Logarithmic
    module Strategies
      class BaseStrategy

        def build
          fail NotImplementedError
        end

        private

        def asc?
          @asc ||= (@global_start <= @global_finish)
        end

        def desc?
          !asc?
        end

        def enough?(value)
          if asc?
            value < @global_finish
          else
            value > @global_finish
          end
        end

      end
    end
  end
end
