class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_category_relations
  has_many :categories, through: :article_category_relations
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 5000 }
  validates :user_id , presence: true
end
