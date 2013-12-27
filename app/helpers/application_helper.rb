module ApplicationHelper
	def link_to_login_with(provider, url, popup = {})
    	link_to t('connect with_facebook', provider: provider), 
    	url, class: 'js-popup btn btn-primary btn-lg', 
    	onclick: "ga('send', 'event', 'fb_signup', 'click');",
      	data: { width: popup[:width], height: popup[:height] }
  	end
end
