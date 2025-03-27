---
title: Spiritual Meadow
layout: layouts/prologue
tags: [nav]
---

    {%- for page in collections.meadow -%}
    {{ page.content | safe }}
      <a href="{{ page.url }}">GOTO</a>
    {%- endfor -%}
