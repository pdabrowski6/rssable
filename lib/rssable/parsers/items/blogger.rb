module RSSable
  module Parsers
    module Items
      class Blogger < RSSable::Parsers::Items::Base

        # Returns the comments count
        # If the comments count node does not exist it returns nil
        #
        # @return [Integer]
        def comments_count
          count = node_text(node.at_xpath("//thr:total"))
          count.to_i unless count.nil?
        end

      end
    end
  end
end
