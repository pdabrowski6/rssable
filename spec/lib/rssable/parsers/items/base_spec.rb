require 'spec_helper'

describe RSSable::Parsers::Items::Base do
  describe '#title' do
    it 'returns the item title' do
      item = described_class.new(node)

      expect(item.title).to eq('Item title')
    end
  end

  describe '#published_at' do
    it 'returns the item publication date' do
      item = described_class.new(node)

      expect(item.published_at).to eq('01/01/2018')
    end
  end

  describe '#link' do
    it 'returns the item link' do
      item = described_class.new(node)

      expect(item.link).to eq('http://google.com')
    end
  end

  describe '#description' do
    it 'returns the item description' do
      item = described_class.new(node)

      expect(item.description).to eq('Description')
    end
  end

  describe '#author' do
    it 'returns the item author' do
      item = described_class.new(node)

      expect(item.author).to eq('Admin')
    end
  end

  describe '#tags' do
    it 'returns the item tags' do
      item = described_class.new(node)

      expect(item.tags).to eq(['Category 1', 'Category 2'])
    end
  end

  describe '#comments_count' do
    it 'returns nil' do
      item = described_class.new(node)

      expect(item.comments_count).to eq(nil)
    end
  end

  def node
    xml = <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <rss>
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
        </item>
        </channel>
      </rss>
    XML

    Nokogiri::XML(xml).css("item").first
  end
end
