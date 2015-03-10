module Kaminari
  module Logarithmic
    class PageProxy < Kaminari::Helpers::Paginator::PageProxy

      def logaritmic_page?
        @options[:logarithmic_pages].include? @page
      end

    end
  end
end
