class ItemTagRelation < ApplicationRecord

  belongs_to :item_name
  belongs_to :tag

end
