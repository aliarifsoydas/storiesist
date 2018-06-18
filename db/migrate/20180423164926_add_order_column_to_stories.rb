class AddOrderColumnToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :order, :integer
  end
end
