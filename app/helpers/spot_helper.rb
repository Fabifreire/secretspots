module SpotHelper
  def spot_image_tag(spot)
    if spot.photo.attached?
      cl_image_tag(spot.photo.key)
    else
      # cl_image_path('cocktail_placeholder')
      image_tag('spot.jpg')
    end
  end
end