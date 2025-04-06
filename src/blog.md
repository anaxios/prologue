---
title: blog
layout: layouts/blog
tags: [nav]
---

{%- for page in collections.blog | reverse -%}

<h1><a href="{{ page.url }}">{{ page.data.title}}</a></h1>
<h3>{{ page.date | dateHuge }}</h3>
<p>{{ page.content | shorten(50) | safe }}   . . .</p>
<p><a href="{{ page.url }}">Read More</a></p>
{%- endfor -%}
