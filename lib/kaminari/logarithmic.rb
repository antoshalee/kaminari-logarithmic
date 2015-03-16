require "kaminari"
require "kaminari/logarithmic/version"
require "kaminari/logarithmic/action_view_extension"
require "kaminari/logarithmic/strategies/base_strategy"
require "kaminari/logarithmic/strategies/even_strategy"
require "kaminari/logarithmic/strategies/fixed_steps_strategy"
require "kaminari/logarithmic/seq_builder"

module Kaminari
  module Logarithmic
  end
end

::ActionView::Base.send :include, Kaminari::Logarithmic::ActionViewExtension
