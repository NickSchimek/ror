require 'ror'
require 'thor'
require 'ror/info'

module Ror
  class CLI < Thor

    desc "info METHOD CLASS", "Display info for the desired method"
    def info modus, klass = nil
      Ror::Info.new(modus).display(klass)
    end

    desc "new_method", "Generates a scaffold for adding new methods"
    def new_method group, *names
      Ror::Generators::NewMethod.start([group, names])
    end
  end
end
