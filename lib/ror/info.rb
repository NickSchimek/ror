require 'ror/validations'

module Ror
  class Info

    def initialize modus, klass
      @modus = modus
      @klass = klass
      @klasses = klass_list
      @validations = Ror::Validations.new @klasses, retrieve_klass('symbol_req')
    end

    def show
      @klass = assign_klass if system_can_retrieve_class?
      return display_info if @validations.valid?
      return method_does_not_exist_error if !@validations.modus_valid?
      display_class_error
    end

    private
    def display_info
      result = method_class
      IO.popen("less", "w") { |f| f.puts IO.read(result) } if result
    end

    def method_class
      result = retrieve_klass
      result.send :show, @modus if result
    end

    def retrieve_klass symbol_req = nil
      case @klass
      when 'actionview', 'view', 'v'
        return 'actionview'.to_sym if symbol_req
        Ror::Actionview
      when 'actioncontroller', 'controller', 'c'
        return 'actioncontroller'.to_sym if symbol_req
        Ror::Actioncontroller
      else
        display_class_error unless symbol_req
      end
    end

    def display_class_error
      puts "Undefined class option: Use 'ror info #{@modus}' to view class options."
    end

    def system_can_retrieve_class?
      @validations.modus_valid? and !@klass
    end

    def klass_list
      begin
        Ror::SupportedMethods.send @modus
      rescue
        false
      end
    end

    def method_does_not_exist_error
      puts "Sorry, method not found. Feel free to add it to expand the knowledge store!"
    end

    def assign_klass
      @validations.mark_klass_assigned
      method_belongs_to_one_class? ? @klasses.first.to_s : ask_user
    end

    def method_belongs_to_one_class?
      @klasses.length == 1
    end

    def ask_user
      puts display_message
      display_klasses
      print ask_for_input
      retrieve_selection
    end

    def display_message
      "\nMultiple classes contain the #{@modus} method.\n"
    end

    def display_klasses
      @klasses.each do |klass|
        puts send(klass)
      end
    end

    def actionview
      "  For: Actionview type 'view' or 'v'"
    end

    def actioncontroller
      "  For: Actioncontroller type 'controller' or 'c'"
    end

    def ask_for_input
      "\n-> Please choose a class for the #{@modus} method? "
    end

    def retrieve_selection
      STDIN.gets.chomp
    end
  end
end
