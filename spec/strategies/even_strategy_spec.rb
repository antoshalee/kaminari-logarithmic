require 'spec_helper'

describe Kaminari::Logarithmic::Strategies::EvenStrategy do
  describe ".build" do
    {
      [1, 100] => [1, 3, 7, 15, 31, 63],
      [100, 1] => [100, 98, 94, 86, 70, 38]
    }.each do |range, pages|
      it { expect(described_class.new(*range).build).to eq pages }
    end
  end

end
