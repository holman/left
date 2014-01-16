---
layout: post
title: Hello World!
category: posts
---

After putting it off for too long (I bought the domain name months ago), I have finally decided to go ahead and create a personal site. I have a decent amount of free time in the weekends during summer, so there is no excuse to put it off any longer. The goal is to own a space to display projects and store any interesting thoughts or experiences I come across in life. Here we go...

---

The setup for this website was surprisingly straight-forward. I was previously experimenting with <a href="http://wordpress.org/">wordpress</a> on an amazon ec2 instance, but I found jekyll + github pages earlier today and realized it would be much simpler. Jekyll is a static site generator. Pretty much all you have to do is specify a few layouts, make some changes to the config file, and you're golden. To create a post, you simply add a markdown file to a _post directory, and jekyll handles the rest. Deploying was even simpler; create a git repo named "yoavz.github.io", push your code and github automatically runs it through jekyll and serves it on a custom domain for you.  

To make it pretty, I'm using the <a href="https://github.com/holman/left">Left</a> jekyll repo by Zach Holman. I haven't modified the design much yet. I'll play around with it more in the future.
