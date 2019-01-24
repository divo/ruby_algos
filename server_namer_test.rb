require_relative 'server_nameer'

describe NameFactory do
  let (:factory) { NameFactory.new() }

  it "should issue a name" do
    expect(factory.issue_name).to eq 0
  end

  it "should issue multiple names" do
    expect(factory.issue_name).to eq 0
    expect(factory.issue_name).to eq 1
    expect(factory.issue_name).to eq 2
    expect(factory.to_s).to eq "0, 1, 2, "
  end

  it "should handle invalid removal" do
    factory.remove_name(5) == nil
  end

  it "should handle last name being removed" do
    factory.issue_name
    factory.remove_name(0)
    expect(factory.to_s).to eq ", "
  end

  it "should handle names removed from middle" do
    factory.issue_name
    factory.issue_name
    factory.issue_name
    factory.issue_name
    factory.remove_name(1)
    factory.remove_name(3)
    expect(factory.to_s).to eq "0, , 2, , "
  end
end
