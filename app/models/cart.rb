class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    sum = 0.00
    self.line_items.each do |line_item|
      sum += line_item.quantity * line_item.item.price
    end
    sum
  end



end
