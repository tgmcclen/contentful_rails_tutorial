class AddPreviewFlagToContentfulUser < ActiveRecord::Migration
  def change
    add_column :contentful_users, :preview, :boolean
  end
end
