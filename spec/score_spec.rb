require 'score'

describe Score do
	let(:score) { Score.new }

	it 'can have a winner' do
		expect(score).to respond_to :winner
	end

	it 'can set a winner' do
		expect(score).to respond_to :winner=
	end

end

