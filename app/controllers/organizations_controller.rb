class OrganizationsController < ApplicationController
  before_action :set_title, only: [:new,:create]

  def new
    @job_categorys = JobCategory.all
    @organization = Organization.new
  end

  def create
    @job_categorys = JobCategory.all
    @organization = Organization.new(organization_params)
     if @organization.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :about, :user_id, :logo)
  end

  def set_title
    @q = Worker.ransack(params[:q])
    @worker = @q.result(distinct: true).page(params[:page])
    @organization = current_user.organization
  end
end
