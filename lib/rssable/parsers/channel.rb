module RSSable
  module Parsers
    class Channel

      def initialize(feed:, driver:)
        @feed = feed
        @driver = driver
      end

      # Returns the RSS feed title
      #
      # @return [String]
      def title
        xml.xpath("//channel").at("title").text
      end

      # Returns the RSS feed description
      #
      # @return [String]
      def description
        xml.xpath("//channel").at("description").text
      end

      # Returns the website link
      #
      # @return [String]
      def link
        xml.xpath("//channel").at("link").text
      end

      # Returns a collection of the RSS feed items
      #
      # @return [Array]
      def items
        xml.css("item").map { |node| item_class.new(node) }
      end

      private

      attr_reader :feed, :driver

      def xml
        @xml ||= Nokogiri::XML(feed)
      end

      def item_class
        @item_class ||= ::RSSable::Parsers::ItemClassBuilder.call(
          driver: driver
        )
      end
    end
  end
end
