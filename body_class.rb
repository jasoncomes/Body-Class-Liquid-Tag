# frozen_string_literal: true

# body_class / https://www.notion.so/highereducation/body_class-40bbcdc644fb4dcda3e285825ae73efb
# Takes the classes following the open tag and appends them to the class property on the body element.
# {% body_class class anotherclass %}

module Jekyll
  class BodyClass < Liquid::Tag
    # Initialize
    def initialize(tag_name, classes = '', tokens)
      super
      @classes = !classes.empty? ? "#{classes.to_s.strip} " : ''
    end

    # Render
    def render(context)
      page = context.registers[:page]

      @classes += "collection-#{page['collection']} "
      @classes += page['layout'] ? "template-#{page['layout']} " : ''
      @classes += page['slug'] ? "page-#{page['slug']} " : ''
      @classes += page['subnav_items'] && page['hide_subnav'] != true ? 'has-subnav ' : ''
      @classes += (context['layout']['body_class'] ? "#{context['layout']['body_class']} " : '') + (page['body_class'] ? "#{page['body_class']} " : '')

      # Return results
      return "class=\"#{@classes.strip}\"" unless @classes.empty?
    end
  end
end

Liquid::Template.register_tag('body_class', Jekyll::BodyClass)
