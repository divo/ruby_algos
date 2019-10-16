describe 'test' do
  let(:subject) { Thrower.new }

  it 'thing' do
    expect(true).to be(true)
  end

  it 'looks for correct error' do
    # StandardError === ArgumentError.new
    expect { subject.arg_error }.to raise_error(StandardError)
  end
end

class Thrower
  def arg_error
    raise ArgumentError
  end

  def std_error
    raise StandardError
  end
end
