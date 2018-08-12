require 'thor/group'
module Ror
  module Generators
    class NewMethod < Thor::Group
      include Thor::Actions
      attr_reader :index

      argument :group, :type => :string
      argument :names, :type => :string

      def initializer
        @index = 0
      end

      def self.source_root
        File.dirname __FILE__
      end

      def copy_method_info
        names.each do |name|
          template "method_info.txt", "lib/ror/method_descriptions/#{name}/#{group}.txt"
          @index += 1
        end
        @index = 0
      end

      def add_code
        inject_into_class "lib/ror/supported_methods.rb", "SupportedMethods" do
          result = []
          names.each { |name| result << name.to_sym }
    """
    def self.#{group}
      #{result}
    end
    """
        end
      end
    end
  end
end
