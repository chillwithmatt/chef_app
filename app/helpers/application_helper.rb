module ApplicationHelper
	def link_to_login_with(provider, url, popup = {})
    	link_to t('.sign_up_with_facebook', provider: provider, onclick: "ga('send', 'event', 'fb_signup', 'click');"), 
    	url, class: 'js-popup btn btn-primary btn-lg', 
      	data: { width: popup[:width], height: popup[:height] }
  	end
end
