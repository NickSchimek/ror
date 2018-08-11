require 'thor/group'
module Ror
  module Generators
    class NewMethod < Thor::Group
      include Thor::Actions
      attr_reader :index

      argument :group, :type => :string
      argument :name, :type => :string

      def initializer
        @index = 0
      end

      def self.source_root
        File.dirname __FILE__
      end

      def copy_method_info
        name.each do |i|
          template("method_info.txt", "lib/ror/method_descriptions/#{i}/#{group}.txt")
          @index += 1
        end
        @index = 0
      end
    end
  end
end
