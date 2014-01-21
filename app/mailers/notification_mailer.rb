class NotificationMailer < ActionMailer::Base

  layout 'notification'
    
  default from: "info@blogapp.com"
  
  def new_user(user)
    @user = user
    mail(subject: "Congratulations!! You have successfully signed up", to: @user.email)
  end
  
  # sends email to author whenever a new article is published
  def new_article(article)
    @article = article
    @author = article.author
    
    mail(subject: "Congratulations!! BlogApp has published a new Artcile", to: @author.email, bcc: ["guleria.arun12@gmail.com"])
  end
  
  def new_article_comment(comment)
    @comment = comment
    @article = @comment.commentable
    @author = @article.author
    mail(subject: "New comment received on your article", to: @author.email, bcc: ["guleria.arun12@gmail.com"])
  end
  
  def new_profile_comment(comment)
    @comment = comment
    @profile = @comment.commentable
    @author = @profile.author
    mail(subject: "New comment received on your profile", to: @author.email, bcc: ["guleria.arun12@gmail.com"])
  end
  
end
