class Article < ActiveRecord::Base

  default_scope order("created_at DESC")
   
  belongs_to :author
  
  has_many :comments, as: :commentable, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true


  after_create do
    NotificationMailer.new_article(self).deliver unless self.new_record?
  end

end
