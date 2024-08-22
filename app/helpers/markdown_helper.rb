require "rouge/plugins/redcarpet"

class CustomRenderHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

module MarkdownHelper
  def markdown(text)
    options = {
      with_toc_data: true,
      hard_wrap:     true,
    }
    extensions = {
      tables: true,
      fenced_code_blocks: true,
      heighlight: true,
      space_after_headers: true,
    }

    renderer = CustomRenderHTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end

  def toc(text)
    renderer = Redcarpet::Render::HTML_TOC.new(nesting_level: 3)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end
end
