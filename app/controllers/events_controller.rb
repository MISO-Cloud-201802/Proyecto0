class EventsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	#GET /events
	def index
		@events = Event.where(user_id: current_user.id).order(created_at: :desc)
	end
	
	#GET /events/:id
	def show
	end
	#GET /events/new
	def new 
		@event = Event.new
	end
	#POST /events/
	def	create
#		render plain: params[:event].inspect

		@event = current_user.events.new event_params 
		if @event.save
			return redirect_to events_path
		end
		render :new

	end
	#GET /events/:id/edit
	def edit 
	end
	#PUT /events/:id
	def update 
		if @event.update event_params
			return redirect_to events_path
		end 
		render :edit
	end
	#DELETE /events/:id
	def destroy 
		@event.destroy
		redirect_to events_path
	end
	
	private
	
	def event_params
		params.require(:event).permit(:name,:category_id,:place,:is_virtual,:start_date,:end_date,:address)
	end
	
	def set_event
		@event = Event.find(params[:id]);
	end
end
