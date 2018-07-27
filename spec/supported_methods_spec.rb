RSpec.describe Ror::SupportedMethods do
  it "has the render method" do
    class_list = Ror::SupportedMethods.render
    expect(class_list).to eq([:actionview, :actioncontroller])
  end

end
