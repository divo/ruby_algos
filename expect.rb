require 'rspec'

class Thing
  def initialize
    puts 'real object'
  end
end


describe 'expect' do
  it 'overides real behaviour' do
    expect(Thing).to receive(:new)
    Thing.new # Nothing is put
  end
end
