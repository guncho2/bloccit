class FavoriteMailer < ApplicationMailer
  default from: "guncho@gmail.com"


  def new_comment(user, post, comment)

 # #18
 # We'll call this method to send an email to users, notifying them that someone
 # has left a comment on one of their favorited posts

     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"

     @user = user
     @post = post
     @comment = comment

 # #19
     mail(to: user.email, subject: "New comment on #{post.title}")
   end


   def new_post(post)

   # #18  notify the post creator that they've favorited their post and will receive updates when it's commented on.
      headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
      headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
      headers["References"] = "<post/#{post.id}@your-app-name.example>"


      @post = post


   # #19
      mail(to: post.user.email, subject: "You are following, #{post.title}!")
    end

end


# At #18, we set three different headers to enable conversation threading in different email clients.
#
# At #19, the mail method takes a hash of mail-relevant information - the subject the to address,
#  the from (we're using the default), and any cc or bcc information - and prepares the email to be sent.
# #
# # ActionMailer follows a similar pattern as Rails controllers; you can define instance variables
# that will be available to your "view" - which is the content sent in the email in this context.
# #
