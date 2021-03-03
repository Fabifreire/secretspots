module PageHelper
  def user_image_tag(user, options = {})
    if user.photo.attached?
      cl_image_tag(user.photo.key, options)
    else
      # cl_image_path('cocktail_placeholder')
      image_tag('profile_placeholder.jpg', options)
    end
  end
end