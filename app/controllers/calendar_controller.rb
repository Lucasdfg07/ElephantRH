class CalendarController < ApplicationController
	def index
		@patients_per_day = OfficeVisit.joins(:patient).where("patients.user_id = ?", current_user.id).order(hour: :ASC).group_by(&:date)
    	@date = params[:date] ? Date.parse(params[:date]) : Date.today
	end	
end
