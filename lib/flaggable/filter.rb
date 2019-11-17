module Flaggable
  class Filter
    cattr_accessor :profane_content_dictionary, :profane_content_pattern

    @@profane_content_dictionary  = File.join(File.dirname(__FILE__), '../../config/profane_content_dictionary.yml')

    def initialize(content)
      @content = content
      @idx = nil
    end

    def match?
      @idx = @content =~ self.class.profane_content_pattern

      !@idx.nil?
    end

    # Extract the text around the match so that we can store
    # it for quick reference when reviewing the transgression
    def sample
      return nil if @idx.nil?

      startpos = @idx > 10 ? @idx - 10 : 0
      endpos = @idx + 20

      @content[startpos, endpos]
    end

    class << self
      def match?(content)
        new(content).match?
      end

      def profane_content_pattern
        @@profane_content_pattern ||= begin
          phrases = YAML.load_file(@@profane_content_dictionary)

          Regexp.new(
            '\b(' + Regexp.union(phrases).source + ')\b',
            Regexp::MULTILINE | Regexp::IGNORECASE
          )
        end
      end
    end
  end
end
