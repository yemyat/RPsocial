class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts
  validates_uniqueness_of :screen_name
  validates_length_of :screen_name,:within=>5..15
 
  validates_exclusion_of :screen_name, :in=>%w(admin superuser)

end
