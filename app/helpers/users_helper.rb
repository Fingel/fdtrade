module UsersHelper

	#returns a gravatar for a users email address
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=http://toxiccode.com/misc/defaultgravatar.png"
		image_tag(gravatar_url, alt: user.first + user.last, class: "gravatar")
	end
end
