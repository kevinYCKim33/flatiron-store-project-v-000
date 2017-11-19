class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    sum = 0.00
    line_items.each do |line_item|
      sum += line_item.quantity * line_item.item.price
    end
    sum
  end


  def add_item(added_item_id)
    line_item = self.line_items.find_by(item_id: added_item_id)
    if line_item #isn't nil
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: added_item_id)
    end
    line_item
  end

  # def add_item(added_item_id)
  #   if self.item_ids.include?(added_item_id)
  #     line_items.each do |line_item|
  #       if line_item.item_id == added_item_id
  #         line_item.quantity += 1
  #         return line_item
  #       end
  #     end
  #   else
  #     item = line_items.build(item_id: added_item_id)
  #   end
  #
  # end

end
