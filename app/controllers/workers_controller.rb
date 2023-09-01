class WorkersController < ApplicationController
	before_action :set_worker, only: [:edit,:update,:show,:destroy]
  before_action :set_title, only: [:index,:new,:create,:show,:edit,:update,:destroy]

   # note : Worker = Employee

	def index
    @job_categorys = current_user.job_categorys
    @current_user_workers = current_user.workers 
		@workers = @current_user_workers.order(created_at: :desc).all.page(params[:page]) 
	end

	def new
	  @job_categorys = JobCategory.all
		@worker = Worker.new
	end

	
	def create
		@job_categorys = JobCategory.all
		@worker = Worker.new(worker_params)	
		if @worker.save
	    redirect_to workers_path, notice: "#{@worker.name} employee has been created successfully"
		else
			render :new
		end
	end	


	def edit
		 @worker = Worker.find(params[:id])
	end


	def update
		 @worker = Worker.find(params[:id])
		if @worker.update(worker_params)
			redirect_to workers_path , notice: "#{@worker.name} has been updated successfully"
		else
			render :edit
		end
	end


	def show
		@worker = Worker.find(params[:id])	
	end


	def destroy
		@worker = Worker.find(params[:id])
		if @worker.destroy
			redirect_to workers_path , notice: " #{@worker.name} has been deleted successfully"
		end
	end


	private

	def worker_params
		params.require(:worker).permit(:first_name, :last_name, :email, :city, :state, :country, :pincode,:address_line1 ,:date_of_birth, :about, :bio, :job_category_id, :user_id)
	end

  def set_title
    @q = Worker.ransack(params[:q])
		@workers = @q.result(distinct: true).page(params[:page])
		@organization = current_user.organization
	end

	def set_worker
    @job_categorys = JobCategory.all
    @worker = Worker.find(params[:id])	
	rescue ActiveRecord::RecordNotFound => error
		redirect_to workers_path , notice: error 
	end
end



