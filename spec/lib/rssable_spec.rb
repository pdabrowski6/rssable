require 'spec_helper'

describe RSSable do
  describe '.subscribe' do
    it 'subscribes to the RSS feed for given website' do
      url = "http://blog.com"
      channel = instance_double(RSSable::Parsers::Channel)
      allow(RSSable::Processor).to receive(:call).with(
        url: url
      ).and_return(channel)

      result = RSSable.subscribe(url)

      expect(result).to eq(channel)
      expect(RSSable::Processor).to have_received(:call).with(
        url: url
      ).once
    end
  end
end
