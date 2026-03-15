{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template with context %}

{% block title %}{{ title }}{%- if theme.index_with_subtitle and subtitle %} - {{ subtitle }}{%- endif %}{% endblock %}

{% block class %}index posts-expand{% endblock %}

{% block content %}

  <section class="home-block home-block-latest">
    <h2 class="home-block-title">最新文章</h2>
  </section>

  {%- for post in page.posts.limit(6).toArray() %}
    {{ partial('_macro/post.swig', {post: post, is_index: true}) }}
  {%- endfor %}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
