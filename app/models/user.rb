class User < ActiveRecord::Base
  include Clearance::User
  is_gravtastic :email,:size=>45

  has_many :posts
  validates_uniqueness_of :screen_name
  validates_length_of :screen_name,:within=>5..15
 
  validates_exclusion_of :screen_name, :in=>%w(admin superuser)
  def before_validation
    self.email = self.email+ '@rp.edu.sg'
  end
  def after_validation
    self.email = self.email.gsub("@rp.edu.sg","")
  end

  def before_create
    self.email = self.email+ '@rp.edu.sg'
  end
end
