class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true
  
  validates :comment, presence: true

  after_create :send_email
  
  private
  
  def send_email
   return if self.new_record?
   if self.commentable.is_a?(Article)
    NotificationMailer.new_article_comment(self).deliver
   elsif self.commentable.is_a?(Profile)
    NotificationMailer.new_profile_comment(self).deliver
   end
  end
 

end
