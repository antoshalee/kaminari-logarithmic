require "kaminari/logarithmic/version"
require "kaminari/logarithmic/action_view_extension"

module Kaminari
  module Logarithmic
  end
end

::ActionView::Base.send :include, Kaminari::Logarithmic::ActionViewExtension
