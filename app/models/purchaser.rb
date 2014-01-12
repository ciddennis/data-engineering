class Purchaser < ActiveRecord::Base
  has_many :items

  def add_item(item_data)
    items.create(item_data)
  end
end