class AddShortToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :stdesc, :string
  end
end
