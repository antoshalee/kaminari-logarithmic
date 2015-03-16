module Kaminari
  module Logarithmic
    module PageProxyExtension
      def logaritmic?
        @options[:logarithmic_pages].include? @page
      end
    end
  end
end
