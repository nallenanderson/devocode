class AddShowFieldsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :title, :string
    add_column :courses, :sales_message, :text
    add_column :courses, :characteristics, :text
    add_column :courses, :testimonial, :text
  end
end
