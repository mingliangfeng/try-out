class CategoryRelation < ActiveRecord::Base
  attr_accessible :parent_id, :show_order, :sub_id
  
  belongs_to :parent, class_name: "Category"
  belongs_to :sub, class_name: "Category"
  
end
