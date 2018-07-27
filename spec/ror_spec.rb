RSpec.describe Ror do
  it "has a version number" do
    expect(Ror::VERSION).not_to be nil
  end

  it "has a list of supported methods" do
    expect(Ror::SupportedMethods).to be_truthy
  end
end
