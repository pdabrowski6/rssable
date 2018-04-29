require 'nokogiri'
require 'rest-client'
require 'URI'
require 'rssable/detection/feed_finder'
require 'rssable/detection/engine_detector'
require 'rssable/parsers/items/base'
require 'rssable/parsers/items/wordpress'
require 'rssable/parsers/items/blogger'
require 'rssable/parsers/items/medium'
require 'rssable/parsers/item_class_builder'
require 'rssable/parsers/channel'
require 'rssable/processor'

module RSSable
  # Returns the channel driver instance
  #
  # @return [RSSable::Parsers::Channel]
  def self.subscribe(url)
    RSSable::Processor.call(
      url: url
    )
  end
end
