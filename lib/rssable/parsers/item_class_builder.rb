module RSSable
  module Parsers
    class ItemClassBuilder
      # Returns the parser class for the given driver
      #
      # @return [Class]
      def self.call(driver:)
        case driver
        when :wordpress
          RSSable::Parsers::Items::Wordpress
        when :blogger
          RSSable::Parsers::Items::Blogger
        when :medium
          RSSable::Parsers::Items::Medium
        else
          RSSable::Parsers::Items::Base
        end
      end
    end
  end
end
