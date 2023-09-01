class JobCategorysController < ApplicationController
  before_action :set_title, only: [:new,:create,:show]

  def new
    @job_category = JobCategory.new
  end

  def create
    @job_category = JobCategory.new(job_category_params)
     if @job_category.save
      redirect_to new_worker_path, notice: 'Category has been created successfully'
    else
      render :new
    end
  end

  def show
   @job_category = JobCategory.find(params[:id])
   @workers = @job_category.workers.all.page(params[:page])
  end

  def destroy
    @job_category = JobCategory.find(params[:id])
    if @job_category.destroy
      redirect_to workers_path , notice: 'Category has been deleted successfully'
    else 
      redirect_to workers_path , notice: 'Category has not been deleted '
    end
  end
 
  private

  def job_category_params
    params.require(:job_category).permit(:name, :user_id)
  end

  def set_title
   @q = Worker.ransack(params[:q])
   @worker = @q.result(distinct: true).page(params[:page])
   @job_categorys = JobCategory.all
   @organization = Organization.first
  end
end
