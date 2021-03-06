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
    expect { Ror::CLI.new.info 'render' }.to output("Sorry, method not found. Feel free to add it to expand the knowledge store!\n").to_stdout
  end

  it 'does not evaluate class with an invalid method' do
    allow(Ror::SupportedMethods).to receive(:render).and_raise("NoMethodError")
    expect { Ror::CLI.new.info 'render', 'actionview' }.to output("Sorry, method not found. Feel free to add it to expand the knowledge store!\n").to_stdout
  end

  it 'asks user for input when missing class parameter' do
    message = "\nMultiple classes contain the render method.\n  For: Actionview type 'view' or 'v'\n "
    message << " For: Actioncontroller type 'controller' or 'c'\n\n-> Please choose a class for the render method? "
    allow(Ror::SupportedMethods).to receive(:render).and_return([:actionview, :actioncontroller])
    allow(STDIN).to receive(:gets).and_return('c')
    allow(IO).to receive(:popen)
    expect { Ror::CLI.new.info 'render' }.to output(message).to_stdout
  end

  context 'methods called with invalid classes' do
    let(:message) { "Undefined class option:\n\nMultiple classes contain the render method.\n" }

    it 'knows the classes that the method belongs to' do
      message << "  For: Actionview type 'view' or 'v'\n\n-> Please choose a class for the render method? "
      allow(Ror::SupportedMethods).to receive(:render).and_return([:actionview])
      allow(STDIN).to receive(:gets).and_return('c')
      allow(IO).to receive(:popen)
      expect { Ror::CLI.new.info 'render', 'actioncontroller' }.to output(message).to_stdout
    end

    it 'asks user for input' do
      message << "  For: Actionview type 'view' or 'v'\n"
      message << "  For: Actioncontroller type 'controller' or 'c'\n\n-> Please choose a class for the render method? "
      allow(Ror::SupportedMethods).to receive(:render).and_return([:actionview, :actioncontroller])
      allow(STDIN).to receive(:gets).and_return('c')
      allow(IO).to receive(:popen)
      expect { Ror::CLI.new.info 'render', 'bar' }.to output(message).to_stdout
    end

    it 'notifies user that invalid option was chosen' do
      allow(Ror::SupportedMethods).to receive(:render).and_return([:actionview, :actioncontroller])
      allow(STDIN).to receive(:gets).and_return('invalid option')
      expect { Ror::CLI.new.info 'render', 'bar' }.to output(/.*invalid option$/).to_stdout
    end
  end
end
