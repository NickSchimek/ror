module Ror
  class Info

    def initialize modus, klass
      @modus = modus
      @klass = klass
      @klasses = klass_list
    end

    def display
      method_validated = @klasses
      if system_can_retrieve_class? method_validated
        @klass = get_klass
        klass_validated = true
      end
      klass_validated = valid_klass? if validation_passed? method_validated, !klass_validated
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
      when klass_paramter_has?(actionview_variations)
        Ror::Actionview
      when klass_paramter_has?(actioncontroller_variations)
        Ror::Actioncontroller
      else
        display_class_error
      end
    end

    def klass_paramter_has? variations
      @klass if variations.include? @klass
    end

    def actionview_variations
      ['actionview', 'view', 'v']
    end

    def actioncontroller_variations
      ['actioncontroller', 'controller', 'c']
    end

    def display_class_error
      puts "Undefined class option: Use 'ror info #{@modus}' to view class options."
    end

    def system_can_retrieve_class? method_validated
      method_validated and !@klass
    end

    def klass_list
      begin
        Ror::SupportedMethods.send @modus
      rescue
        false
      end
    end

    def valid_klass?
      @klasses.include? klass_variation
    end

    def klass_variation
      case @klass
      when klass_paramter_has?(actionview_variations)
        'actionview'.to_sym
      when klass_paramter_has?(actioncontroller_variations)
        'actioncontroller'.to_sym
      end
    end

    def validation_passed? method_validated, klass_validated
      method_validated and klass_validated
    end

    def method_does_not_exist_error
      puts "Sorry, method not found. Feel free to add it to expand the knowledge store!"
    end

    def get_klass
      method_belongs_to_one_class? ? @klasses.first.to_s : ask_user
    end

    def method_belongs_to_one_class?
      @klasses.length == 1
    end

    def ask_user
      puts display_message, display_klasses, ask_for_input
      retrieve_selection
    end

    def display_message
      "\nMultiple classes contain the #{@modus} method.\nFor:"
    end

    def display_klasses
      @klasses.each do |klass|
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
