module Ror
  class Info

    def initialize modus, klass
      @modus = modus
      @klass = klass
    end

    def display
      method_validated = klasses = validate?
      if system_can_retrieve_class? method_validated
        @klass = get_klass klasses
        klass_validated = true
      end
      klass_validated = valid_klass?(klasses) if validation_passed? method_validated, !klass_validated
      if validation_passed? method_validated, klass_validated
        return display_info
      elsif !method_validated
        return method_does_not_exist_error
      else
        display_class_error
      end
    end

    private
    def display_info
      result = method_class
      IO.popen("less", "w") { |f| f.puts IO.read(result) } if result
    end

    def method_class
      result = ror_class
      result.send :show, @modus if result
    end

    def ror_class
      case @klass
      when 'actionview', 'view', 'v'
        Ror::Actionview
      when 'actioncontroller', 'controller', 'c'
        Ror::Actioncontroller
      else
        display_class_error
      end
    end

    def display_class_error
      puts "Undefined class option: Use 'ror info #{@modus}' to view class options."
    end

    def system_can_retrieve_class? method_validated
      method_validated and !@klass
    end

    def validate?
      begin
        Ror::SupportedMethods.send @modus
      rescue
        false
      end
    end

    def valid_klass? klasses
      klasses.include? transform
    end

    def transform
      case @klass
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

    def get_klass klasses
      method_belongs_to_one_class?(klasses) ? klasses.first.to_s : ask_user(klasses)
    end

    def method_belongs_to_one_class? klasses
      klasses.length == 1
    end

    def ask_user klasses
      puts display_message, display_klasses(klasses), ask_for_input
      retrieve_selection
    end

    def display_message
      "\nMultiple classes contain the #{@modus} method.\nFor:"
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

    def ask_for_input
      "\nPlease choose a class for the #{@modus} method? "
    end

    def retrieve_selection
      STDIN.gets.chomp
    end
  end
end
