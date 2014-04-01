# require 'jekyll/localization'
# jekyll-i18n
# — A simple plugin for multilingual Jekyll sites
# Author: Liam Edwards-Playne <liamz.co>
# License: GPLv3

require 'i18n'
require 'pathname'

I18n.enforce_available_locales = false

module Jekyll
  I18n.load_path += Dir['_i18n/*.yml']

  class TranslateTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    # Gets a translation of a key according to the page.lang
    def render(context)
      # See https://www.iana.org/assignments/language-subtag-registry for full list of tags
      I18n.locale = context.registers[:page]['lang'].intern
      I18n.t(@text.strip)
    end
  end

  module LocalizeFilter
    def localize(input, format = nil)
      I18n.locale = @context.registers[:page]['lang'].intern
      format = (format =~ /^:(\w+)/) ? $1.to_sym : format
      I18n.l input, :format => format
    end

    alias_method :l, :localize
  end

  # Necessary filter when you need multi-language site variables (e.g. menus)
  module TranslateFilter

    def translate(input, language = nil)
      I18n.locale = language || @context.registers[:page]['lang'].intern
      I18n.t(input.strip)
    end

    alias_method :t, :translate

  end

  module Convertible
    alias_method :_read_yaml, :read_yaml

    # Enhances the original method to extract the language from the extension.
    # Then adds it as a tag
    def read_yaml(base, name)
      rv = _read_yaml(base, name)

      # Infer language from first dot in filename.
      lang = (name.split '.')[1]

      if lang == 'mul' or I18n.available_locales.include? lang.intern
        data['lang'] = lang
      else
        # Default language is undefined.
        # If we are procesing a layout, we don't set a language/
        # This is so when we do render_liquid, we don't override the page's lang.
        data['lang'] = site.config['default_lang'] if not self.is_a? Jekyll::Layout
      end

      # Add the language as a tag.
      data['tags'] ||= []
      data['tags'] << data['lang']

      rv
    end

    alias_method :_render_liquid, :render_liquid

    def render_liquid(content, payload, info, path = nil)
      info[:registers][:page]['lang'] = data['lang']
      _render_liquid(content, payload, info)
    end

  end

  class Page

    alias_method :_url, :url
    # Enhances original by applying /LANG/URL.
    def url     
      @url = _url
      lang = data['lang']
      # For 'mul' we generate multiple pages — inappropriate to have a url here.
      # For 'und' there is no language — return.
      if lang == 'mul' or lang == 'und' or lang == @site.config['default_lang']
        return @url
      end

      # Gets filename
      name = Pathname.new(@url).basename.to_s
      # this could be bad if the directory has the same name as the file.
      # XXX substitute the last occurance in a string, not the first.
      nameWithoutLang = @url.sub(name, name.sub('.'+lang, ''))
      nameWithoutLang == '/index/' ? "/#{lang}/index.html" : "/#{lang}/"+nameWithoutLang
    end

  end

  # XXX this could probably be made more Ruby-like.
  class Post

    alias_method :_url, :url
    # Enhances original by applying /LANG/URL
    def url
      @url = _url
      lang = data['lang']
      # For 'mul' we generate multiple pages — inappropriate to have a url here
      # For 'und' there is no language — return
      if lang == 'mul' or lang == 'und' or lang == @site.config['default_lang']
        return @url
      end

      # Gets filename
      name = Pathname.new(@url).basename.to_s
      # this could be bad if the directory has the same name as the file
      # XXX substitute the last occurance in a string, not the first
      nameWithoutLang = @url.sub(name, name.sub('.'+lang, ''))
      nameWithoutLang == '/index/' ? "/#{lang}/index.html" : "/#{lang}"+nameWithoutLang
    end

  end
end

Liquid::Template.register_tag('t', Jekyll::TranslateTag)
Liquid::Template.register_filter(Jekyll::LocalizeFilter)
Liquid::Template.register_filter(Jekyll::TranslateFilter)