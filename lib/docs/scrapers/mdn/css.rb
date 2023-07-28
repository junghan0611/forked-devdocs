module Docs
  class Css < Mdn
    # release = '2023-04-24'
    self.name = 'CSS'
    self.base_url = 'https://developer.mozilla.org/ko/docs/Web/CSS'
    self.root_path = '/Reference'
    self.links = {
      home: 'https://developer.mozilla.org/ko/docs/Web/CSS',
      code: 'https://github.com/mdn/translated-content/tree/main/files/ko/web/css'
    }

    html_filters.push 'css/clean_html', 'css/entries'

    options[:root_title] = 'CSS'

    options[:skip] = %w(/CSS3 /Media/Visual /paged_media /Media/TV /Media/Tactile)
    options[:skip] += %w(/mq-boolean /single-transition-timing-function) # bug
    options[:skip_patterns] = [/Extensions/, /Tools/, /@media\/-webkit/, /webkit-mask/, /-moz-system-metric/]

    options[:replace_paths] = {
      '/%3Cbasic-shape%3E' => '/basic-shape',
      '/fallback' => '/@counter-style/fallback',
      '/range' => '/@counter-style/range',
      '/symbols' => '/@counter-style/symbols',
      '/system' => '/@counter-style/system',
      '/var' => '/var()',
      '/element' => '/element()',
      '/Flexbox' => '/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes',
      '/flexbox' => '/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes',
      '/currentColor' => '/color_value'
    }

    options[:fix_urls] = ->(url) do
      url.sub! %r{https://developer\.mozilla\.org/ko\-KR/docs/CSS/([\w\-@:])}, "#{Css.base_url}/\\1"
      url.sub! '%3A', ':'
      url.sub! '%40', '@'
      url
    end
  end
end
