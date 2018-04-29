module RSSable
  module Parsers
    module Items
      class Base
        def initialize(node)
          @node = node
        end

        # Returns the item title
        #
        # @return [String]
        def title
          node_text(node.at("title"))
        end

        # Returns the item link
        #
        # @return [String]
        def link
          node_text(node.at("link"))
        end

        # Returns the item publication date
        #
        # @return [String]
        def published_at
          node_text(node.at("pubDate"))
        end

        # Returns the item description
        #
        # @return [String]
        def description
          node_text(node.at("description"))
        end

        # Returns an array of the item categories
        #
        # @return [Array<String>]
        def tags
          node.css("category").map(&:text)
        end

        # Returns the article author
        #
        # @return [String]
        def author
          node_text(node.at("author"))
        end

        # Returns nil by the default
        #
        # @return [NilClass]
        def comments_count; end

        private

        attr_reader :node

        def node_text(node)
          node.text unless node.nil?
        end
      end
    end
  end
end
