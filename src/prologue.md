---
title: Prologue
layout: layouts/prologue
tags: [nav]
---

<h2>{{ title }}</h2>
<ul>
{%- for page in collections.prologue -%}
      <li><a href="{{ page.url }}">{{  page.url | prologueUrlToMonthDate }}</a></li>
{%- endfor -%}
</ul>
