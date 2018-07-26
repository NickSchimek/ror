require 'ror'
require 'thor'
module Ror
  class CLI < Thor
    desc "m METHOD CLASS", "Display info for the desired method"
    def m method, klass = nil
      # TODO: infer klass unless klass.
      klass ? puts(ror_class(klass).send method) : puts("Which #{method} method?") #TODO:
    end

    private
      def ror_class klass
        case klass
        when 'view'
          Ror::Actionview
        when 'controller'
          Ror::Actioncontroller
        else
          puts "Undefined class option: Use 'ror m METHOD' to view class options."
        end
      end
  end
end
