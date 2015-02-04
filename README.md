# Left

Left is a clean, whitespace-happy layout for [Jekyll](https://github.com/mojombo/jekyll).

This is designed to be an easy layout to modify for your own blog. It was
extracted from [zachholman.com](http://zachholman.com/), which means it was
battle-hardened from years of posting serious blog posts about emoji and swear
words.

You can see it live right here: <http://zachholman.com/left/>

![Left](http://cl.ly/image/3S2r1p2C0E2B/content)

## Installation

- Install Jekyll: `gem install jekyll`
- [Fork this repository](https://github.com/holman/left/fork)
- Clone it: `git clone https://github.com/YOUR-USER/left`
- Run the jekyll server: `jekyll serve -w`

You should have a server up and running locally at <http://localhost:4000>.

## Customization

Next you'll want to change a few things. Most of them can be changed directly in
[_config.yml](https://github.com/holman/left/blob/gh-pages/_config.yml). That's
where we'll pull your name, Twitter username, and things like that.

There's a few other places that you'll want to change, too:

- [CNAME](https://github.com/holman/left/blob/gh-pages/CNAME): If you're using
  this on GitHub Pages with a custom domain name, you'll want to change this
  to be the domain you're going to use. All that should be in here is a
  domain name on the first line and nothing else (like: `example.com`).
- [favicon.ico](https://github.com/holman/left/blob/gh-pages/favicon.ico): This
  is a smaller version of my gravatar for use as the icon in your browser's
  address bar. You should change it to whatever you'd like.
- [apple-touch-icon.png](https://github.com/holman/left/blob/gh-pages/apple-touch-icon.png):
  Again, this is my gravatar, and it shows up in iOS and various other apps
  that use this file as an "icon" for your site.

## Deployment

Left is designed to be deployed to [GitHub Pages](http://pages.github.com). It
uses [repository metadata](https://help.github.com/articles/repository-metadata-on-github-pages)
to generate some of your content, like your GitHub URL and avatar information (so you
might not actually see it locally until you push it up to Pages).

All you should have to do is rename your repository on GitHub to be
`username.github.com`. Since everything is on the `gh-pages` branch, you
should be able to see your new site at <http://username.github.io>.

## Licensing

This is [MIT](https://github.com/holman/left/blob/gh-pages/LICENSE) with no
added caveats, so feel free to use this on your site without linking back to
me or using a disclaimer or anything silly like that.

If you'd like give me credit somewhere on your blog or tweet a shout out to
[@holman](https://twitter.com/holman), well hey, I'll take it.
