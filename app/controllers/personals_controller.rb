class PersonalsController < ApplicationController
	before_action :set_personal, only: [:edit,:update,:show,:destroy]
  before_action :set_title, only: [:index,:new,:create,:show,:edit,:update,:destroy]

  # note : Personal = Document

	def index
		@job_categorys = JobCategory.all
		@personals = Personal.all
	end

	def new
		@job_categorys = JobCategory.all
		@personal = Personal.new
		@worker_id = params[:worker_id]
	end

	 def create
    @job_categories = JobCategory.all
    @personal = Personal.new(personal_params)
    if @personal.save
    	@worker_reterive_id = @personal.worker_id
      redirect_to worker_path(@worker_reterive_id), notice: 'Document has been created successfully'
    else
      render :new
    end
  end 


	def edit
	end


	def update
		if @personal.update(personal_params)
			redirect_to workers_path , notice: 'Document has been updated successfully'
		else
			render :edit
		end
	end


	def show
		# @personal = Personal.find(params[:id])	
	end


	def destroy
		@personal = Personal.find(params[:id])
		@worker = @personal.worker
		if @personal.destroy
			redirect_to worker_path(@worker) , notice: 'Document has been deleted successfully'
		else 
			render :show
		end

	end

	def published
		@worker = Worker.where()
	end


	private

	def personal_params
		params.require(:personal).permit(:name, :doc_type, :worker_id, :image)
	end

  def set_title
   @organization = Organization.first
	 @q = Worker.ransack(params[:q])
	 @worker = @q.result(distinct: true).page(params[:page])
  end

	def set_personal
		@job_categorys = JobCategory.all
		@personal = Personal.find (params[:id])
	rescue ActiveRecord::RecordNotFound => error
		redirect_to personals_path , notice: error 
	end
end