class ApplicationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @application = Applications.all
  end
  def create
    @application = Applications.new(permitted_parameters)
    if @application.save
      Resque.enqueue(Sleeper)
      flash[:notice] = "Application was created."
      render :text => @application.token
    end
  end
  def update
    @application = Applications.find_by(token:params[:application_token])
    if @article.update_attributes(permitted_parameters)
    end
  end
  def permitted_parameters
    params.require(:application).permit(:name)
  end
end