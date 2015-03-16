module Kaminari
  module Logarithmic
    module ActionViewExtension
      def paginate_logarithmic(scope, options = {}, &block)
        paginator = Kaminari::Logarithmic::Paginator.new self, options.reverse_merge(:current_page => scope.current_page, :total_pages => scope.total_pages, :per_page => scope.limit_value, :remote => false)
        paginator.to_s
      end
    end
  end
end
