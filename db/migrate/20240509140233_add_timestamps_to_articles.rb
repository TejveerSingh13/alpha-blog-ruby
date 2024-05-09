class AddTimestampsToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :created_at, :datetime 
    # add_column table_name, column, datatype 
    add_column :articles, :updated_at, :datetime
  end
end
