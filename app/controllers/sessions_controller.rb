class SessionsController < ApplicationController
	def new
	end

	def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
         	sign_in user
         	redirect_back_or root_url
        else
         	flash.now[:error] = 'Invalid email/password combination' 
         	render 'new'
        end
    end

    def createfb
        user = User.from_omniauth(env["omniauth.auth"])
        sign_in user
        render_or_redirect
    end

	def destroy
        sign_out
        redirect_to root_url
    end

    private
        def render_or_redirect
            user = User.from_omniauth(env["omniauth.auth"])
            page = user_path(user)
            @page = page
            if env['omniauth.params']['popup']
              render 'callback', layout: false
            else
              redirect_to page
            end
        end

end
