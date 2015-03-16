module Kaminari
  module Logarithmic
    module Strategies
      class FixedStepsStrategy < BaseStrategy
        def initialize(start, finish, base = 10)
          @global_start = start
          @global_finish = finish
          @base = base
        end

        def build
          start = next_point_or_itself(@global_start, @base)
          step = @base
          result = []
          while enough?(start)
            finish = next_finish(start, step)
            result += seq_with_step(start, finish, step)
            start = next_point(finish, step * @base)
            step *= @base
          end
          result
        end

        private

        def next_finish(start, step)
          variants = [@global_finish, next_point(start, step * @base)]
          asc? ? variants.min : variants.max
        end

        # if value is divisible by step return itself
        def next_point_or_itself(value, step)
          if (value % step) == 0
            value
          else
            next_point(value, step)
          end
        end

        def next_point(value, step)
          if asc?
            ((value + step) / step) * step
          else
            return (value - step) if value % step == 0
            (value / step) * step
          end
        end

        def seq_with_step(start, finish, step)
          step = -step if desc?
          start.step(finish, step).to_a
        end
      end
    end
  end
end
