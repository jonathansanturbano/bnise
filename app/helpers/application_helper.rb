module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'BNI$E'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
  def default_meta_tags
      {
        site: 'https://www.bnice.studio/',
        title: 'BNI$E',
        reverse: true,
        separator: '|',
        description: 'Paris based South African artist that molds and colorizes faces made out of clay',
        keywords: 'art, artist, clay, Paris',
        canonical: request.original_url,
        noindex: !Rails.env.production?,
        icon: [
          { href: image_url('favicon.ico') },
          { href: image_url('logo_white.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
        ],
        og: {
          site_name: 'BNI$E',
          title: 'BNI$E - Sculptures in Paris',
          description: 'Paris based South African artist that molds and colorizes faces made out of clay',
          type: 'website',
          url: request.original_url,
          image: image_url('four_heads_logo.jpg')
        }
      }
    end
end
