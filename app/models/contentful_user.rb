class ContentfulUser < ActiveRecord::Base
  # Gets all entries and it's links for defined Content Type in Configuration
  def render
    client.entries(include: 2, content_type: content_type, order: 'fields.slug')
  end

  def complete?
    name? && space_id? && access_token? && content_type?
  end

  private

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
