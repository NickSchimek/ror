require 'ror'
require 'thor'

module Ror
  class CLI < Thor
    desc "info METHOD CLASS", "Display info for the desired method"
    def info modus, klass = nil
      klass = get_klass modus unless klass
      IO.popen("less", "w") { |f| f.puts IO.read(display_method_information(modus, klass)) }
    end

    desc "new_method", "Generates a scaffold for adding new methods"
    def new_method group, *name
      Ror::Generators::NewMethod.start([group, name])
    end

    private
      def display_method_information modus, klass
        ror_class(klass).send modus
      end

      def ror_class klass
        case klass
        when 'view', 'v'
          Ror::Actionview
        when 'controller', 'c'
          Ror::Actioncontroller
        else
          puts "Undefined class option: Use 'ror info METHOD' to view class options."
        end
      end

      def get_klass modus
        class_list = list_of modus
        extract_class class_list, modus
      end

      def list_of modus
        Ror::SupportedMethods.send modus
      end

      def extract_class class_list, modus
        method_belongs_to_one_class?(class_list) ? class_list.first : ask_user(class_list, modus)
      end

      def method_belongs_to_one_class? class_list
        class_list.length == 1
      end

      def ask_user class_list, modus
        puts "\nMultiple classes contain the #{modus} method.\nFor:"
        class_list.each do |klass|
          puts send(klass)
        end
        print "\nPlease choose a class for the #{modus} method? "
        retrieve_selection
      end

      def retrieve_selection
        STDIN.gets.chomp
      end

      def actionview
        "Actionview type 'view' or 'v'"
      end

      def actioncontroller
        "Actioncontroller type 'controller' or 'c'"
      end
  end
end
