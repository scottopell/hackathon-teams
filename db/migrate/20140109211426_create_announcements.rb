class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :source
      t.string :message
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
