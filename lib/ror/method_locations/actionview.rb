module Ror
  class Actionview
    METHOD_DESCRIPTION_DIR = 'ror/method_descriptions/actionview'

    def self.show modus
      self.file_location "#{modus}.txt"
    end

    private
      def self.file_location file_name
        File.join FILE_DIR, METHOD_DESCRIPTION_DIR, file_name
      end
  end
end
