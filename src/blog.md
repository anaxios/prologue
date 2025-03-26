---
title: blog
layout: layouts/blog
tags: [nav]
---

<ul>
{%- for page in collections.blog -%}
      <li><a href="{{ page.url }}">{{  page.url }}</a></li>
{%- endfor -%}
</ul>
