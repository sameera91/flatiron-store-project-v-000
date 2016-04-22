class Item < ActiveRecord::Base
  has_many :line_items
  has_many :carts, through: :line_items
  belongs_to :category

  def self.available_items
    self.where("inventory > 0")
  end
=begin
    binding.pry
    item = Item.find_by(self.item_id)
    available_items = []
    if !self.inventory.nil?
      available_items << self
    end
    available_items
  end
=end
end
