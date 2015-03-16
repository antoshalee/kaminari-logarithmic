require "kaminari"
require "kaminari/helpers/paginator"
require "kaminari/logarithmic/version"
require "kaminari/logarithmic/action_view_extension"
require "kaminari/logarithmic/page_proxy_extension"
require "kaminari/logarithmic/paginator"
require "kaminari/logarithmic/strategies/base_strategy"
require "kaminari/logarithmic/strategies/even_strategy"
require "kaminari/logarithmic/strategies/fixed_steps_strategy"
require "kaminari/logarithmic/seq_builder"

module Kaminari
  module Logarithmic
  end
end

::ActionView::Base.send :include, Kaminari::Logarithmic::ActionViewExtension
::Kaminari::Helpers::Paginator::PageProxy.send :include, Kaminari::Logarithmic::PageProxyExtension
