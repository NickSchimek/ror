require 'ror/supported_methods'
require 'ror/cli'

RSpec.describe Ror::CLI do

  it 'can display info when the method belongs to one class' do
    expect(Ror::SupportedMethods).to receive(:render).and_return([:actionview])
    expect(IO).to receive(:popen).and_return('Method: render\n Class: Actionview')
    result = Ror::CLI.new.info 'render'
    expect(result).to eq('Method: render\n Class: Actionview')
  end

  it 'validates method argument' do
    allow(Ror::SupportedMethods).to receive(:render).and_raise("NoMethodError")
    expect { Ror::CLI.new.info 'render' }.to output("Sorry, method not found. Please add it and submit a PR\n").to_stdout
  end

  it 'does not evaluate class with an invalid method' do
    allow(Ror::SupportedMethods).to receive(:render).and_raise("NoMethodError")
    expect { Ror::CLI.new.info 'render', 'actionview' }.to output("Sorry, method not found. Please add it and submit a PR\n").to_stdout
  end

  it 'knows the classes that the method belongs to' do
    expect(Ror::SupportedMethods).to receive(:render).and_return([:actionview])
    expect { Ror::CLI.new.info 'render', 'actioncontroller' }.to output("Undefined class option: Use 'ror info render' to view class options.\n").to_stdout
  end
end
