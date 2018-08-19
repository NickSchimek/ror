require 'ror'
require 'thor'

module Ror
  class CLI < Thor

    desc "info METHOD CLASS", "Display info for the desired method"
    def info modus, klass = nil
      method_validated = klasses = validate? modus
      if system_can_retrieve_class? method_validated, klass
        klass = get_klass modus, klasses
        klass_validated = true
      end
      klass_validated = valid_klass?(klass, klasses) if validation_passed? method_validated, !klass_validated
      if validation_passed? method_validated, klass_validated
        return display_info(modus, klass)
      elsif !method_validated
        return method_does_not_exist_error
      else
        display_class_error modus
      end
    end

    desc "new_method", "Generates a scaffold for adding new methods"
    def new_method group, *names
      Ror::Generators::NewMethod.start([group, names])
    end

    private
      def display_info modus, klass
        result = method_class modus, klass
        IO.popen("less", "w") { |f| f.puts IO.read(result) } if result
      end

      def method_class modus, klass
        result = ror_class klass, modus
        result.send :show, modus if result
      end

      def ror_class klass, modus
        case klass
        when 'actionview', 'view', 'v'
          Ror::Actionview
        when 'actioncontroller', 'controller', 'c'
          Ror::Actioncontroller
        else
          display_class_error modus
        end
      end

      def display_class_error modus
        puts "Undefined class option: Use 'ror info #{modus}' to view class options."
      end

      def system_can_retrieve_class? method_validated, klass
        method_validated and !klass
      end

      def validate? modus
        begin
          Ror::SupportedMethods.send modus
        rescue
          false
        end
      end

      def valid_klass? klass, klasses
        klasses.include? transform(klass)
      end

      def transform klass
        case klass
        when 'actionview', 'view', 'v'
          'actionview'.to_sym
        when 'actioncontroller', 'controller', 'c'
          'actioncontroller'.to_sym
        end
      end

      def validation_passed? method_validated, klass_validated
        method_validated and klass_validated
      end

      def method_does_not_exist_error
        puts "Sorry, method not found. Feel free to add it to expand the knowledge store!"
      end

      def get_klass modus, klasses
        method_belongs_to_one_class?(klasses) ? klasses.first.to_s : ask_user(klasses, modus)
      end

      def method_belongs_to_one_class? klasses
        klasses.length == 1
      end

      def ask_user klasses, modus
        puts display_message(modus), display_klasses(klasses), ask_for_input(modus)
        retrieve_selection
      end

      def display_message modus
        "\nMultiple classes contain the #{modus} method.\nFor:"
      end

      def display_klasses klasses
        klasses.each do |klass|
          puts send(klass)
        end
      end

      def actionview
        "Actionview type 'view' or 'v'"
      end

      def actioncontroller
        "Actioncontroller type 'controller' or 'c'"
      end

      def ask_for_input modus
        "\nPlease choose a class for the #{modus} method? "
      end

      def retrieve_selection
        STDIN.gets.chomp
      end
  end
end
