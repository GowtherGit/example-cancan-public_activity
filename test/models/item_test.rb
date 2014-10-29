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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
