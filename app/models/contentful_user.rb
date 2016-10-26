class ContentfulUser < ActiveRecord::Base
  # Gets all entries and it's links for defined Content Type in Configuration
  def render
    client.entries(content_type: content_type, order: 'fields.slug')
  end

  def product(slug)
    client.entries(content_type: client.content_types.detect {|c| c.name == 'Product' }.id, 'fields.slug': slug).first
  end

  def complete?
    name? && space_id? && access_token? && content_type?
  end

  # Creates a Contentful Client Instance
  def client
    params = {
        access_token: access_token,
        space: space_id,
        dynamic_entries: :auto,
        raise_errors: true
    }
    params[:api_url] = 'preview.contentful.com' if preview?
    @client ||= Contentful::Client.new(params)
  end
end
