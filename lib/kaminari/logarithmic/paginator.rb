module Kaminari
  module Logarithmic
    class Paginator < ::Kaminari::Helpers::Paginator
      def initialize(template, options)
        @logarithmic_strategy = options[:strategy]
        super(template, options)

        precalculate_logarithnmic_pages
      end

      def each_relevant_page
        extended_options = @window_options.merge(
          logarithmic_pages: @left_log_seq + @right_log_seq
        )

        return to_enum(:each_relevant_page) unless block_given?
        relevant_pages(@window_options).each do |i|
          yield PageProxy.new(extended_options, i, @last)
        end
      end

      alias each_page each_relevant_page

      def relevant_pages(options)
        left_window_plus_one = 1.upto(options[:left] + 1).to_a
        right_window_plus_one = (options[:total_pages] - options[:right]).upto(options[:total_pages]).to_a
        inside_window_plus_each_sides = (options[:current_page] - options[:window] - 1).upto(options[:current_page] + options[:window] + 1).to_a

        log_pages_with_gaps = \
          @left_log_seq.map { |p| [p, p - 1] }.flatten +
          @right_log_seq.map { |p| [p, p + 1] }.flatten

        (
          left_window_plus_one +
          inside_window_plus_each_sides +
          log_pages_with_gaps +
          right_window_plus_one
        ).uniq.sort.reject { |x| (x < 1) || (x > options[:total_pages]) }
      end

      def precalculate_logarithnmic_pages
        builder_options = { strategy: @logarithmic_strategy }
        left_start = @window_options[:current_page] - @window_options[:window] - 1
        left_finish = @window_options[:left] + 1
        @left_log_seq = SeqBuilder.new(left_start, left_finish, builder_options).build.reverse

        right_start = @window_options[:current_page] + @window_options[:window] + 1
        right_finish = @window_options[:total_pages] - @window_options[:right]
        @right_log_seq = SeqBuilder.new(right_start, right_finish, builder_options).build
      end
    end
  end
end
