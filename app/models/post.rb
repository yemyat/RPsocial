class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :status
end
