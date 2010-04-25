class User < ActiveRecord::Base
  include Clearance::User
  is_gravtastic :gravatar_email,:size=>60

  has_many :posts
  has_many :comments
  
  validates_uniqueness_of :screen_name
  validates_length_of :screen_name,:within=>5..15

  validates_exclusion_of :screen_name, :in=>%w(admin superuser delete DELETE select SELECT)
  validates_exclusion_of :password, :in=>%w(delete DELETE select SELECT)




  def before_validation
    self.email = self.email+ '@rp.edu.sg'
  end
  def after_validation
    self.email = self.email.gsub("@rp.edu.sg","")
  end

  def before_create
    
    self.email = self.email+ '@rp.edu.sg'
    if self.gravatar_email.blank?
      self.gravatar_email = self.email
    end
    self.email =Sanitize.clean(self.email)
    self.screen_name = Sanitize.clean(self.screen_name)
    self.password =Sanitize.clean(self.password)
  end
end
