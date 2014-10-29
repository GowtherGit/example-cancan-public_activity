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

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
