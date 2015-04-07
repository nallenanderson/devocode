class RemoveSlugFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :slug, :string
  end
end
