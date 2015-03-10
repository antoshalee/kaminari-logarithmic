module Kaminari
  module Logarithmic
    class SeqBuilder
      BASE = 10

      class << self
        def build(start, finish)
          start = next_point(start, 1)
          asc_log_seq(start, finish)
        end

        private

        def asc_log_seq(start, global_finish)
          power = 0
          result = []
          while start < global_finish
            power += 1
            finish = [global_finish, next_point(start, power + 1)].min
            result += seq_with_step(start, finish, power)
            start = next_point(finish, power + 1)
          end
          result
        end

        def next_point(value, power)
          base = BASE ** power
          ((value + base) / base) * base
        end

        def prev_point(value, power)
          base = BASE ** power
          (value / base) * base
        end

        def seq_with_step(start, finish, power)
          step = BASE ** power
          (start..finish).step(step).to_a
        end
      end

    end
  end
end
