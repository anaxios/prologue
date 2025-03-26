---
title: Spiritual Meadow
layout: layouts/prologue
tags: [nav]
---

<ul>
    {%- for page in collections.meadow -%}
      <li><a href="{{ page.url }}">{{  page.url }}</a></li>
    {%- endfor -%}
</ul>
