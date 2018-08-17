require 'ror/supported_methods'
require 'ror/cli'

RSpec.describe Ror::CLI do

  it 'can display info when the method belongs to one class' do
    expect(Ror::SupportedMethods).to receive(:render).and_return([:actionview])
    expect(IO).to receive(:popen).and_return('Method: render\n Class: Actionview')
    result = Ror::CLI.new.info 'render'
    expect(result).to eq('Method: render\n Class: Actionview')
  end
end
