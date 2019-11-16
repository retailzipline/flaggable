module Flaggable
  class Filter
    cattr_accessor :profane_content_dictionary, :profane_content_pattern

    @@profane_content_dictionary  = File.join(File.dirname(__FILE__), '../../config/profane_content_dictionary.yml')

    class << self
      def match?(content)
        content =~ profane_content_pattern
      end

      def profane_content_pattern
        @@profane_content_pattern ||= begin
          phrases = YAML.load_file(@@profane_content_dictionary)
          Regexp.new('(\b|^)' + Regexp.union(phrases).to_s + '(\b|$)')
        end
      end
    end
  end
end
