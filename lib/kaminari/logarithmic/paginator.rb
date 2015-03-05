module Kaminari
  module Logarithmic

    class Paginator < ::Kaminari::Helpers::Paginator

      def relevant_pages(options)
        []
      end

    end

  end
end
