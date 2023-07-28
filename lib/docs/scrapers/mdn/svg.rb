module Docs
  class Svg < Mdn
    prepend FixInternalUrlsBehavior
    prepend FixRedirectionsBehavior

    # release = '2023-04-24'
    self.name = 'SVG'
    self.base_url = 'https://developer.mozilla.org/ko/docs/Web/SVG'
    self.links = {
      home: 'https://developer.mozilla.org/ko/docs/Web/SVG',
      code: 'https://github.com/mdn/translated-content/tree/main/files/ko/web/svg'
    }

    html_filters.push 'svg/clean_html', 'svg/entries'

    options[:root_title] = 'SVG'

    options[:title] = ->(filter) do
      if filter.slug.starts_with?('Element/')
        "<#{filter.default_title}>"
      elsif filter.slug != 'Attribute' && filter.slug != 'Element'
        filter.default_title
      else
        false
      end
    end

    options[:fix_urls] = ->(url) do
      url.sub! 'https://developer.mozilla.org/ko-KR/Web/SVG', Svg.base_url
      url.sub! 'https://developer.mozilla.org/ko/docs/SVG', Svg.base_url
      url.sub! 'https://developer.mozilla.org/ko/SVG', Svg.base_url
      url
    end
  end
end
