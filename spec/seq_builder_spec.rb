require 'spec_helper'

describe Kaminari::Logarithmic::SeqBuilder do

  {
    [45, 670] => [50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600],
    [315, 2346] => [320, 330, 340, 350, 360, 370, 380, 390, 400, 500, 600, 700, 800, 900, 1000, 2000]
  }.each do |bounds, pages|
    puts bounds.inspect
    it { expect(described_class.build(*bounds)).to eq pages }
  end





end
