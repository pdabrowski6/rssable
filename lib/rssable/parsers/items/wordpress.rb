module RSSable
  module Parsers
    module Items
      class Wordpress < RSSable::Parsers::Items::Base

        # Returns the article author
        #
        # @return [String]
        def author
          creator_node = node.elements.find { |c| c.name == "creator" }
          node_text(creator_node)
        end

        # Returns the comments count
        # If the comments count node does not exist it returns nil
        #
        # @return [Integer]
        def comments_count
          count = node_text(node.at_xpath("//slash:comments"))
          count.to_i unless count.nil?
        end
      end
    end
  end
end
