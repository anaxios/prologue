---
title: blog
layout: layouts/blog
tags: [nav]
---

{%- for page in collections.blog | reverse -%}

<h2><a href="{{ page.url }}">{{ page.data.title}}</a></h2>
<h4>{{ page.date | dateHuge }}</h4>
<p>{{ page.content | shorten(50) | safe }}   . . .</p>
<p><a href="{{ page.url }}">Read More</a></p>
{%- endfor -%}
