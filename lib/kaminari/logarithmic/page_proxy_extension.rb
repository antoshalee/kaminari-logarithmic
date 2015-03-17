module Kaminari
  module Logarithmic
    module PageProxyExtension
      def logarithmic?
        return false unless @options[:logarithmic_pages].present?
        @options[:logarithmic_pages].include? @page
      end
    end
  end
end
