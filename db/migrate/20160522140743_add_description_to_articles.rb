class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    #add_column table(plurals), column, type
    add_column :articles, :description, :text

    #Names have to be created_at and updated_at otherwise Rails won't track it
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
