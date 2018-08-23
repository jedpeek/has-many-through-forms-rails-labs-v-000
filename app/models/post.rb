class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |i, attributes|
      c = Category.find_or_create_by(name: attributes.name)
      self.post_categories.build{category: c}


end
