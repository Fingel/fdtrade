module UsersHelper

	#returns a gravatar for a users email address
	def gravatar_for(user, options = { size: 50 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		default_gravatar = "http://toxiccode.com/misc/defaultgravatar.png"
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}?d=#{default_gravatar}"
		image_tag(gravatar_url, alt: user.first + user.last, class: "gravatar")
	end
	
	def full_name(user)
		user.first + " " + user.last
	end
end
