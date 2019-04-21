module RSSable
  module Detection
    class FeedFinder
      # It returns array of RSS feed links for given URL
      #
      # @return [Array<String>]
      def self.call(url:)
        response = RestClient.get(url)
        html = Nokogiri::HTML(response.body)

        links = html.css("link[type='application/rss+xml']").map { |node| node[:href] }
        
        return links if links.size > 0

        url.end_with?('/') ? ["#{url}feed/"] : ["#{url}/feed/"]
      end
    end
  end
end
