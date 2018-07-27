module Ror
  class Actioncontroller
    METHOD_DESCRIPTION_DIR = 'ror/method_descriptions/actioncontroller'

    def self.render
      self.file_location 'render.txt'
    end

    private
      def self.file_location file_name
        File.join LIB_ROR_DIR, METHOD_DESCRIPTION_DIR, file_name
      end
  end
end
