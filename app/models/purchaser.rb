class Purchaser < ActiveRecord::Base
  has_many :items, dependent: :destroy

  def add_item(item_data)
    items.create(item_data)
  end
end