---
title: blog
layout: layouts/blog
tags: [nav]
---

{%- for page in collections.blog | reverse -%}

<h2><a href="{{ page.url }}">{{ page.data.title}}</a></h2>
<h4>{{ page.date }}</h4>
<p>{{ page.data.description }}</p>

{%- endfor -%}
