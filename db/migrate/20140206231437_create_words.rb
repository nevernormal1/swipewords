class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :value
      t.string :prefix
      t.string :suffix

      t.timestamps
    end
  end
end
