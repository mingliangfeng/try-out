class Category < ActiveRecord::Base
  attr_accessible :name
  
  has_many :sub_relations, class_name: "CategoryRelation", foreign_key: :parent_id
  has_many :sub_categories, through: :sub_relations, source: :sub
  
  has_many :parent_relations, class_name: "CategoryRelation", foreign_key: :sub_id
  has_many :parent_categories, through: :parent_relations, source: :parent
  
  scope :group_parent_categories, joins("left join category_relations on categories.id = category_relations.sub_id").group("categories.id")
  scope :top_categories, group_parent_categories.having("count(category_relations.id) = 0")
  scope :sub_categories, group_parent_categories.having("count(category_relations.id) > 0")
  
end
