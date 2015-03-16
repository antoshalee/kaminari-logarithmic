module Kaminari
  module Logarithmic
    module PageProxyExtension
      def logaritmic_page?
        @options[:logarithmic_pages].include? @page
      end
    end
  end
end
