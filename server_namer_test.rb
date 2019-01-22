require_relative 'server_nameer'

describe NameFactory do
  let (:factory) { NameFactory.new() }

  it "should issue a name" do
    factory.issue_name == 1
  end

  it "should issue multiple names" do
    expect(factory.issue_name).to eq 0
    #factory.issue_name == 1
    factory.issue_name == 2
    factory == "1, 2," # Ruby is dynamic and smart enough to figure this out
  end

  it "should handle invalid removal" do
    factory.remove_name(5) == nil
  end

  it "should handle last name being removed" do
    factory.issue_name
    factory.remove_name(0)
    factory == " "
  end

  it "should handle names removed from middle" do
    factory.issue_name
    factory.issue_name
    factory.issue_name
    factory.issue_name
    factory.remove_name(1)
    factory.remove_name(3)
    factory == "0, ,2 , "
  end
end
