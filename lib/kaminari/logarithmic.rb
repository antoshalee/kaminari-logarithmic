require "kaminari"
require "kaminari/logarithmic/version"
require "kaminari/logarithmic/action_view_extension"
require "kaminari/logarithmic/seq_builder"

module Kaminari
  module Logarithmic
  end
end

::ActionView::Base.send :include, Kaminari::Logarithmic::ActionViewExtension
