module UsersHelper
  def gravatar_for user, options = {size: 60}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    gravatar_url = Settings.user.avatar
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
