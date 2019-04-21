require 'spec_helper'

describe RSSable::Detection::FeedFinder do
  describe '.call' do
    it 'returns RSS feed links for given URL' do
      url = "http://website.com"
      html = '<html><head><link rel="alternate" type="application/rss+xml" title="feed" href="http://website.com/feed/" /></head><body></body></html>'
      response = double('response', body: html)
      allow(RestClient).to receive(:get).with(url).and_return(response)

      result = described_class.call(
        url: url
      )

      expect(RestClient).to have_received(:get).with(url).once
      expect(result).to eq(["http://website.com/feed/"])
    end

    it 'returns default feed link for given URL' do
      url = "http://website.com"
      html = ''
      response = double('response', body: html)
      allow(RestClient).to receive(:get).with(url).and_return(response)

      result = described_class.call(
        url: url
      )

      expect(RestClient).to have_received(:get).with(url).once
      expect(result).to eq(["http://website.com/feed/"])
    end
  end
end
