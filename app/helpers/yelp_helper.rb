module YelpHelper

	def float_path(float)
		#if a float ends with '.5', add '_half'
		if float % 1 == 0.5
			return (float-0.5).to_i.to_s + "_half"
		else
			return float.to_i
		end
	end

	def match_stars(float, size)
		folder_path = "yelp_stars/web_and_ios/#{size}/#{size}_#{float_path(float)}"
	end

	def match_stars_at_zoom(float, size, zoom)
		folder_path = "assets/images/yelp_stars/web_and_ios/#{size}/#{size}_#{float_path(float)}@#{zoom}x"
	end

end
