class AddStDescToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :stdesc, :string
  end
end
