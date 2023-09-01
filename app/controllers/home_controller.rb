class HomeController < ApplicationController
	def index 
	  if current_user.present?
	  	@organization = current_user.organization
	  end
	  @q = Worker.ransack(params[:q])
	  @worker = @q.result(distinct: true).page(params[:page])
	  @job_categorys = JobCategory.all
	end
end 