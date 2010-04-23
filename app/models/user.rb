class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts
  validates_uniqueness_of :screen_name
  validates_length_of :screen_name,:within=>5..15
 
  validates_exclusion_of :screen_name, :in=>%w(admin superuser)

  def before_validation
    self.email = self.email+ '@myrp.edu.sg'
  end
  def after_validation
    self.email = self.email.gsub("@myrp.edu.sg","")
  end
end
