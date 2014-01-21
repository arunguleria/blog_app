class Profile < ActiveRecord::Base
  
  belongs_to :author
  
  has_many :comments, as: :commentable
  
  validates :date_of_birth, presence: true
  validates :author, presence: true
  validates :author_id, uniqueness: true
  
end
