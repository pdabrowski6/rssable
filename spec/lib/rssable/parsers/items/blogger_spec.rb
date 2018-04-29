require 'spec_helper'

describe RSSable::Parsers::Items::Blogger do

  describe '#comments_count' do
    it 'returns comments count for the item' do
      item = described_class.new(node)

      expect(item.comments_count).to eq(12)
    end
  end

  def node
    xml = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <rss xmlns:thr="http://purl.org/syndication/thread/1.0">
        <channel>
        <title>Feed title</title>
        <description>Feed description</description>
        <link>http://blog.com</link>
        <item>
          <title>Item title</title>
          <link>http://google.com</link>
          <pubDate>01/01/2018</pubDate>
          <description>Description</description>
          <category>Category 1</category>
          <category>Category 2</category>
          <author>Admin</author>
          <thr:total>12</thr:total>
        </item>
        </channel>
      </rss>
    XML

    Nokogiri::XML(xml).css("item").first
  end
end
