class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  force_ssl if: :ssl_configured?
  before_action :prepare_meta_tags, if: "request.get?"

  def ssl_configured?
    !Rails.env.development?
  end

  def prepare_meta_tags(options={})
    site_name   = "Presetter"
    title       = "The ACR and Lightroom Preset Installer"
    description = "Presetter is a custom installer for your Lightroom and ACR presets."
    #image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      #image:       image,
      description: description,
      keywords:    %w[lightroom adobe acr installer presets camera raw profile],
      #twitter: {
      #  site_name: site_name,
      #  site: '@thecookieshq',
      #  card: 'summary',
      #  description: description,
      #  image: image
      #},
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        #image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
