class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts

  validates_uniqueness_of :screen_name
end
