class AddColumnToStats < ActiveRecord::Migration
  def change
    add_column :stats, :disconnect, :integer, :default => 0
  end
end
