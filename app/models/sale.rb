# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  total      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Sale < ActiveRecord::Base
  # relationship
  belongs_to :user
  has_many   :items

  # nested attributes
  accepts_nested_attributes_for :items, allow_destroy: true

  def subtotals
    self.items.map { |i| i.subtotal }
  end

  def total_all
    subtotals.sum
  end

  # public_activity
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end
