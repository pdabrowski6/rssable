require 'spec_helper'

describe RSSable::Processor do
  describe '.call' do
    it 'returns nil if feed URL is not found' do
      url = "http://blog.com"
      urls = ["http://blog.com/feed/", "http://blog.com/comments/feed/"]
      driver = :wordpress
      allow(RSSable::Detection::FeedFinder).to receive(:call).with(
        url: url
      ).and_return(urls)
      allow(RSSable::Detection::EngineDetector).to receive(:call).with(
        urls: urls, source_url: url
      ).and_return([])

      result = described_class.call(url: url)

      expect(result).to eq(nil)
      expect(RSSable::Detection::FeedFinder).to have_received(:call).with(
        url: url
      ).once
      expect(RSSable::Detection::EngineDetector).to have_received(:call).with(
        urls: urls, source_url: url
      ).once
    end

    it 'returns channel instance' do
      url = "http://blog.com"
      urls = ["http://blog.com/feed/", "http://blog.com/comments/feed/"]
      feed_url = "http://blog.com/feed/"
      driver = :wordpress
      allow(RSSable::Detection::FeedFinder).to receive(:call).with(
        url: url
      ).and_return(urls)
      allow(RSSable::Detection::EngineDetector).to receive(:call).with(
        urls: urls, source_url: url
      ).and_return([feed_url, driver])
      response = double('response', body: 'feed')
      allow(RestClient).to receive(:get).with(feed_url).and_return(response)
      channel = instance_double(RSSable::Parsers::Channel)
      allow(RSSable::Parsers::Channel).to receive(:new).with(
        feed: response.body, driver: driver
      ).and_return(channel)

      result = described_class.call(url: url)

      expect(result).to eq(channel)
      expect(RSSable::Detection::FeedFinder).to have_received(:call).with(
        url: url
      ).once
      expect(RSSable::Detection::EngineDetector).to have_received(:call).with(
        urls: urls, source_url: url
      ).once
    end
  end
end
