require 'spec_helper'

describe RSSable::Parsers::ItemClassBuilder do
  describe '.call' do
    it 'returns RSSable::Parsers::Items::Wordpress if driver is :wordpress' do
      expect(described_class.call(driver: :wordpress)).to eq(RSSable::Parsers::Items::Wordpress)
    end

    it 'returns RSSable::Parsers::Items::Blogger if driver is :blogger' do
      expect(described_class.call(driver: :blogger)).to eq(RSSable::Parsers::Items::Blogger)
    end

    it 'returns RSSable::Parsers::Items::Medium if driver is :medium' do
      expect(described_class.call(driver: :medium)).to eq(RSSable::Parsers::Items::Medium)
    end

    it 'returns RSSable::Parsers::Items::Base if driver is not detected' do
      expect(described_class.call(driver: :custom)).to eq(RSSable::Parsers::Items::Base)
    end
  end
end
