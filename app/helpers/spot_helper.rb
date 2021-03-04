module SpotHelper
  def spot_image_tag(spot)
    if spot.photo.attached?
      cl_image_tag(spot.photo.key)
    else
      # cl_image_path('cocktail_placeholder')
      image_tag('spot.jpg')
    end
  end

  def avg_rating(spot)
    reviews = spot.reviews
    if reviews.any?
      sum = 0
      reviews.each do |r|
        sum += r.rating
      end
      sum / reviews.count
    else
      0
    end
  end
end
