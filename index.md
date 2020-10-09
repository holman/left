---
layout: layout
title: "Posts"
---

<section class="content">
  <ul class="listing">
    {% for post in site.posts %}
      {% unless post.draft %}
      <li>
        <span>{{ post.date | date: "%B %e, %Y" }}</span> <a href="{{ post.url }}">{{ post.title }}</a>
      </li>
      {% endunless %}
    {% endfor %}
  </ul>
</section>
