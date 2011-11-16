class AddDescColumnGameTable < ActiveRecord::Migration
  def up
    add_column :games, :custom, :string
    add_column :games, :youtube_url, :string
    add_column :games, :extension_name, :string
    add_column :games, :extension_class, :string
  end

  def down
    remove_column :games, :custom
    remove_column :games, :youtube_url
  end
end
