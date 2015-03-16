module Kaminari
  module Logarithmic
    module PageProxyExtension
      def logarithmic?
        @options[:logarithmic_pages].include? @page
      end
    end
  end
end
