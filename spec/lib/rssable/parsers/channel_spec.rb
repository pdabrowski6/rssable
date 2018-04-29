require 'spec_helper'

describe RSSable::Parsers::Channel do
  describe '#title' do
    it 'returns the feed title' do
      channel = described_class.new(
        feed: xml_feed, driver: :wordpress
      )

      expect(channel.title).to eq("Feed title")
    end
  end

  describe '#description' do
    it 'returns the feed description' do
      channel = described_class.new(
        feed: xml_feed, driver: :wordpress
      )

      expect(channel.description).to eq("Feed description")
    end
  end

  describe '#items' do
    it 'returns the feed items' do
      allow(RSSable::Parsers::ItemClassBuilder).to receive(:call).with(
        driver: :wordpress
      ).and_return(RSSable::Parsers::Items::Wordpress)

      channel = described_class.new(
        feed: xml_feed, driver: :wordpress
      )
      result = channel.items

      expect(result.size).to eq(1)
      expect(result.first).to be_instance_of(RSSable::Parsers::Items::Wordpress)
    end
  end

  describe '#link' do
    it 'returns the feed link' do
      channel = described_class.new(
        feed: xml_feed, driver: :wordpress
      )

      expect(channel.link).to eq("http://blog.com")
    end
  end

  def xml_feed
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
        </item>
        </channel>
      </rss>
    XML
  end
end
