---
layout: post
title: Gzip Rails and Heroku
category: posts
---
This is a call to action for all those of you who are running your
rails app on heroku without gzip. **PLEASE ADD GZIP** to your
servers. If you are on heroku its as easy as adding a gem to your
Gemfile and it will make a greater speed improvement on your site
then a day of optermising queires will do on the backend.

Gzip has been supported in browsers for ages and was even
rolled into **internet exploere 6** (_although with some bugs_)
so its definatley production safe for all your sites.

The site I am working on is not a javascript heavy site yet thanks
to some crazy and sometimes useful
([SpinJs](https://github.com/dnagir/spinjs-rails) check it out)
the app has around 800KB of uncompressed static CSS and Javascript.

Enter [webpagetest.org](http://webpagetest.org) and
[heroku deflater](https://github.com/romanbsd/heroku-deflater).

**Web Page Test** is a great site for analysing your
sites performance and is great for all the mac users as it can give you a screenshot of your site using internet explorer 9 or 10 without having to borrow someones pc or fire up a VM.

**Heroku Deflater** is one of many heroku rails based compression rack middleware gems but it was quick and easy to setup and had decent defaults for our needs. The whole process of setting up the gem testing it on staging then creating a pull request for master happened in the space of my company's friday meeting.

To install add this to your Gemfile

```ruby
gem 'heroku-deflater', :group => :production
```

Once implemented I found that our page size was almost halved and I'm sure this could be improved even further with some tweaking.

Let me know if you have used this gem or similar ones and what results you have found

### useful links
- [github.com/romanbsd/heroku-deflater](https://github.com/romanbsd/heroku-deflater)
- [webpagetest.org](http://webpagetest.org)
- [Measuring Ruby](http://www.confreaks.com/videos/2668-gogaruco2013-measuring-ruby) A great talk about performance in rails (_although mostly on the server side_)
- [@hanloongliauw](twitter.com/hanloong)
- [@hanloong on GitHub](http://github.com/hanloong)

those last two are maybe not so useful
