# This might not work anymore because I changed from User to seller in the real version.

class UserMailerPreview < ActionMailer::Preview
  def sold
    user = User.second
    UserMailer.sold(user)
  end
end
