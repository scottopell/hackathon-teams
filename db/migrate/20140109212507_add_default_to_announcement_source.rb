class AddDefaultToAnnouncementSource < ActiveRecord::Migration
  def change
    change_column :announcements, :source, :string, :default => :internal
  end
end
