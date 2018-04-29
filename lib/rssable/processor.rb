module RSSable
  class Processor
    def self.call(url:)
      # Returns the RSSable::Parsers::Channel instance
      # If the feed URL is not detected it returns nil
      #
      # @return [RSSable::Parsers::Channel]
      urls = RSSable::Detection::FeedFinder.call(url: url)
      feed_url, driver = RSSable::Detection::EngineDetector.call(
        urls: urls, source_url: url
      )

      return if feed_url.nil?

      response = RestClient.get(feed_url)

      RSSable::Parsers::Channel.new(
        feed: response.body, driver: driver
      )
    end
  end
end
