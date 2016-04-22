class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total = 0
    self.items.collect do |item|
      total = total + item.price
    end
    total
  end

  def add_item(item)
    if !self.items.include?(Item.find_by(id: item))
      line_item = line_items.new
      line_item.item_id = item
    else
      line_item = line_items.find_by(item_id: item)
      line_item.update(item_id: item)
    end
    line_item
  end

end
