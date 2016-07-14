class Category < ActiveRecord::Base
  has_many :article_category_relations
  has_many :articles, through: :article_category_relations
  validates :name, presence: true, length: { minimum: 3, maximum: 20}, uniqueness: true
end
