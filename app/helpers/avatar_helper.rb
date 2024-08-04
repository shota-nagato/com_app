module AvatarHelper
  def avatar_url_for(user)
    if user.avatar.attached?
      user.avatar
    else
      "avatar.svg"
    end
  end
end
