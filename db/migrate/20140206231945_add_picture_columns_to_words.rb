class AddPictureColumnsToWords < ActiveRecord::Migration
  def self.up
    add_attachment :words, :picture
  end

  def self.down
    remove_attachment :words, :picture
  end
end
