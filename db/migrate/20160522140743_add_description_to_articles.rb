class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    #add_column table, column, type
    add_column :articles, :description, :text
    
    #Names have to be created_At and updated_At otherwise Rails won't track it
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
