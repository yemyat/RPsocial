class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :status

  def before_create
    self.status = Sanitize.clean(self.status)
  end
end
