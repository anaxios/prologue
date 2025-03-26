---
title: blog
layout: layouts/blog
tags: [nav]
---

<ul>
{%- for page in collections.blog | reverse -%}
      <li><a href="{{ page.url }}">{{  page.data.title}}</a>&emsp;{{ page.date }}</li>
{%- endfor -%}
</ul>
