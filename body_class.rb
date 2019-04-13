# frozen_string_literal: true

# body_class / https://github.com/jasoncomes/Body-Class-Liquid-Tag
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
      @classes += (context['layout']['body_class'] ? "#{context['layout']['body_class']} " : '') + (page['body_class'] ? "#{page['body_class']} " : '')

      # Return results
      return "class=\"#{@classes.strip}\"" unless @classes.empty?
    end
  end
end

Liquid::Template.register_tag('body_class', Jekyll::BodyClass)
