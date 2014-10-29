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

class Product < ActiveRecord::Base
  # relationship
  belongs_to :user
  has_many   :items

  # callbacks
  before_create :set_code

  def generate_code(size = 6)
   charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
   (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

  def set_code
   self.code = generate_code(6)
  end

  # public_activity
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end
