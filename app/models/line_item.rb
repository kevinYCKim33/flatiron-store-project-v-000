class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  ## also clever...
  # def total
  #   item.price * quantity
  # end

end
