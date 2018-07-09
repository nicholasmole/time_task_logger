require 'bowling'

RSpec.describe Bowling, '#score' do
	context "with no strikes or spars" do	
		it "sums the pin count" do
			bowling = Bowling.new
			20.times { bowling.hit(4)}
			expect(bowling.score).to eq 80
		end
	end
end