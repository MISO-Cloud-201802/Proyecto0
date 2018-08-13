class WelcomeController < ApplicationController
  def index
	if current_user.user_signed_in
		return redirect_to events_path
	end
end
