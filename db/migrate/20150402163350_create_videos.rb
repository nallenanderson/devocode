class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :link
      t.text :description
      t.boolean :viewed
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :videos, :courses
  end
end
