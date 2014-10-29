# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  sale_id    :integer
#  quantity   :integer
#  total      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
  # relationship
  belongs_to :product
  belongs_to :sale

  # callbacks
  before_save :set_total

  def set_total
    if self.quantity.blank?
      0
    else
      self.total = self.quantity * self.product.price
    end
  end

  def subtotal
    if self.quantity.blank?
      0
    else
      self.quantity * self.product.price
    end
  end
end
