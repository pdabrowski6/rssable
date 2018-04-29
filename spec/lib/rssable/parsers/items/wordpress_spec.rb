require 'spec_helper'

describe RSSable::Parsers::Items::Wordpress do

  describe '#author' do
    it 'returns the item author' do
      item = described_class.new(node)

      expect(item.author).to eq('Admin')
    end
  end

  describe '#comments_count' do
    it 'returns comments count for the item' do
      item = described_class.new(node)

      expect(item.comments_count).to eq(12)
    end
  end

  def node
    xml = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <rss xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:slash="http://purl.org/rss/1.0/modules/slash/">
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
          <dc:creator>Admin</dc:creator>
          <slash:comments>12</slash:comments>
        </item>
        </channel>
      </rss>
    XML

    Nokogiri::XML(xml).css("item").first
  end
end
