class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total = 0
    self.line_items.collect do |line_item|
      item = Item.find_by(id: line_item.item_id)
      total = total + (item.price*line_item.quantity)
    end
    total
  end

  def add_item(item_id)
=begin
    line_item = self.line_items.find_by(item_id: item)
     if line_item
       quantity = line_item.quantity+1
      line_item.update(quantity: quantity)
      line_item
     else
       self.line_items.build(item_id: item, cart_id: self.id, quantity: 1)
       self.line_items
     end
=end

    if line_item = self.line_items.find_by(:item_id => item_id)
        quantity = line_item.quantity+1
      line_item.update(quantity: quantity)
        line_item           
      else          
      self.line_items.build(:item_id => item_id, :cart_id => self.id)     
      end         
  end  

end
