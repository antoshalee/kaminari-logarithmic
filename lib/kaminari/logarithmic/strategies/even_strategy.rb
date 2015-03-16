module Kaminari
  module Logarithmic
    module Strategies
      class EvenStrategy < BaseStrategy

        def initialize(start, finish, base = 2)
          @global_start = start
          @global_finish = finish
          @base = base
        end

        def build
          value = @global_start
          step = @base
          result = []
          while enough?(value)
            result << value
            if asc?
              value = value + step
            else
              value = value - step
            end
            step *= @base
          end
          result
        end

      end
    end
  end
end
