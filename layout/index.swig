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

  <section class="home-block home-block-topics">
    <h2 class="home-block-title">专题合集</h2>
    <div class="topic-grid">
      <a class="topic-card" href="{{ url_for('/categories/论文阅读/') }}">
        <span class="topic-card-title">训练</span>
        <span class="topic-card-desc">训练策略与论文拆解</span>
      </a>
      <a class="topic-card" href="{{ url_for('/categories/分布式基础/') }}">
        <span class="topic-card-title">推理</span>
        <span class="topic-card-desc">分布式与推理流程实践</span>
      </a>
      <a class="topic-card" href="{{ url_for('/tags/shell/') }}">
        <span class="topic-card-title">工具</span>
        <span class="topic-card-desc">命令、脚本与效率工具</span>
      </a>
      <a class="topic-card" href="{{ url_for('/categories/其它/') }}">
        <span class="topic-card-title">杂项</span>
        <span class="topic-card-desc">零散问题与经验记录</span>
      </a>
    </div>
  </section>

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
