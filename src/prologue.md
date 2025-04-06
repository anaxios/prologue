---
title: Prologue
layout: layouts/prologue
tags: [nav]
---

<h1>{{ title }}</h1>
<ul>
{%- for page in collections.prologue | prologueSort -%}
      <li><a href="{{ page.url }}">{{  page.url | prologueUrlToMonthDate }}</a></li>
{%- endfor -%}
</ul>
