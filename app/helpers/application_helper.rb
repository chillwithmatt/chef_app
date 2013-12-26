module ApplicationHelper
	def link_to_login_with(provider, url, popup = {})
		if session[:mobile_param]
			link_to "Sign up with Facebook", "/auth/facebook", 
				id: "sign_in", class: "btn btn-primary btn-lg", 
				onclick: "ga('send', 'event', 'fb_signup', 'click');"
		else
    		link_to t('.sign_up_with_facebook', provider: provider), url,
      			class: 'js-popup btn btn-primary btn-lg', 
      			data: { width: popup[:width], height: popup[:height], 
      			onclick: "ga('send', 'event', 'fb_signup', 'click');" }
      	end
  	end
end
