# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  price      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
