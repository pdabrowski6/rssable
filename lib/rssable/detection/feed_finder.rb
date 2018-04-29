module RSSable
  module Detection
    class FeedFinder
      # It returns array of RSS feed links for given URL
      #
      # @return [Array<String>]
      def self.call(url:)
        response = RestClient.get(url)
        html = Nokogiri::HTML(response.body)

        html.css("link[type='application/rss+xml']").map { |node| node[:href] }
      end
    end
  end
end
