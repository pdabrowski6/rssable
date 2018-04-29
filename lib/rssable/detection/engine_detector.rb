module RSSable
  module Detection
    class EngineDetector
      MAPPINGS = {
        blogger: /\/feeds\/posts\/default\?alt\=rss$/,
        wordpress: /\/feed\/$/,
        medium: /medium\.com\/feed\//
      }

      # It returns array of RSS feed link and the driver
      # If feed link is not found it returns blank array
      # If the provider is not detected it returns :default
      #
      # @return [Array]
      def self.call(urls:, source_url:)
        result = nil

        urls.each do |url|
          result = if url.match(MAPPINGS[:blogger])
            [url, :blogger]
          elsif url.match(MAPPINGS[:wordpress]) && url.match(/\/comments\//).nil?
            [url, :wordpress]
          elsif url.match(MAPPINGS[:medium])
            [url, :medium]
          elsif url == "/feed.xml"
            parsed_url = URI.join(source_url, "/feed.xml")
            [parsed_url.to_s, :jekyll]
          end

          break unless result.nil?
        end

        return result unless result.nil?

        if urls.size != 0
          [urls.first, :default]
        else
          []
        end
      end

      private

      attr_reader :urls
    end
  end
end
