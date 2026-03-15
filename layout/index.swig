{% extends '_layout.swig' %}

{% block title %}{{ title }}{%- if theme.index_with_subtitle and subtitle %} - {{ subtitle }}{%- endif %}{% endblock %}

{% block class %}index posts-expand{% endblock %}

{% block content %}

  <div class="home-layout">
    <section class="home-main">
      <section class="home-block home-block-latest">
        <h2 class="home-block-title">最新文章</h2>
      </section>

      {%- for post in page.posts.limit(6).toArray() %}
        {{ partial('_macro/post.swig', {post: post, is_index: true}) }}
      {%- endfor %}

      {% include '_partials/pagination.swig' %}
    </section>

    <aside class="home-about">
      <a class="home-about-avatar" href="{{ url_for('/about/') }}" aria-label="about">
        <img src="{{ url_for(theme.avatar.url or theme.images + '/avatar.gif') }}" alt="{{ author }}">
      </a>
      <h3 class="home-about-title">关于</h3>
      <p class="home-about-desc">{{ description }}</p>
      <ul class="home-about-stats">
        <li><span class="label">文章</span><span class="value">{{ site.posts.length }}</span></li>
        <li><span class="label">分类</span><span class="value">{{ site.categories.length }}</span></li>
        <li><span class="label">标签</span><span class="value">{{ site.tags.length }}</span></li>
      </ul>
    </aside>
  </div>

{% endblock %}

{% block sidebar %}
{% endblock %}
