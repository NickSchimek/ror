require 'ror'
require 'thor'
require 'ror/info'

module Ror
  class CLI < Thor

    desc "info METHOD CLASS", "Displays info for the desired method"
    def info modus, klass = nil
      Ror::Info.new(modus, klass).display
    end

    desc "new_method", "Generates a scaffold for adding new methods"
    def new_method group, *names
      Ror::Generators::NewMethod.start([group, names])
    end
  end
end
