module MetaTaggable
  extend ActiveSupport::Concern

  include ActionView::Helpers::AssetUrlHelper

  included do
    before_action :prepare_meta_tags
  end

  private

  def prepare_meta_tags(options = {})
    base = t('meta_tags.base')

    site = base[:site]
    description = base[:description]
    title = t("meta_tags.titles.#{controller_name}.#{action_name}", default: '')
    image = image_url('image.png')

    defaults = {
      site: site,
      description: description,
      keywords: base[:keywords],
      og: {
        url: request.url,
        description: description,
        type: 'article',
      },
      twitter: {
        card: 'summary',
        site: '@simpliejp',
        description: description,
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags(options)
  end
end
