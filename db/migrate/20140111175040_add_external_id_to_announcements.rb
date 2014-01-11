class AddExternalIdToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :external_id, :integer
  end
end
