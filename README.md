# The RSSable Ruby gem

Pull the RSS feed for any website you want without worrying about the RSS feed existence or engine. The gem takes a URL address, finds the RSS feed, detects the generator and returns standardized feed interface as a simple Ruby object.

## Installation
    gem install rssable

## What drivers are currently supported

In the most cases, all RSS feeds have the main structure standardized but sometimes it is required to parse the feed differently. Currently, following custom drivers are supported: `wordpress`, `blogger`, `medium.com` and `jekyll`. However, any RSS feed should work very well out of the box. If you will find a feed with the different structure that the gem does not handle well, please submit a new issue.

## Usage Examples

All you have to do is to subscribe to a given URL (without specyfing the RSS feed URL):

```ruby
channel = RSSable.subscribe("http://pdabrowski.com/blog")
channel.title # => "Ruby on Rails and Stuff by Paweł Dąbrowski"
```

If the RSS feed is not available it will return `nil`:

```ruby
RSSable.subscribe("https://github.com") # => nil
```

**Access the channel data**

You can access the main channel attributes:

```ruby
channel = RSSable.subscribe("http://pdabrowski.com/blog")

feed.title # => "Ruby on Rails and Stuff by Paweł Dąbrowski"
feed.description # => "Web development with Ruby on Rails"
feed.link # => "http://pdabrowski.com/blog"
```

**Access the channel items**

You can access the channel items by calling `#items` on the channel instance:

```ruby
items = channel.items
items.size # => 10

last_article = items.first
last_article.title # => "3 things that slow down and make your RSpec tests worse"
last_article.link # => "http://pdabrowski.com/blog/ruby-on-rails/testing/3-things-that-slow-down-and-make-your-rspec-tests-worse/"
last_article.published_at # => "Wed, 21 Mar 2018 05:25:15 +0000"
last_article.creator # => "Paweł Dąbrowski"
last_article.description # => "There are a lot of things that can slow down your tests &#8211; some of them are related to your code and some not."
last_article.tags # => ["Ruby on Rails", "RSpec"]
last_article.comments_count # => 15
```

## Supported Ruby Versions
This gem was tested on the 2.5.0 version. If it's not working with older versions please add a new issue.

## Copyright
Copyright (c) 2018 Paweł Dąbrowski.
See [LICENSE][] for details.

[license]: LICENSE.md
