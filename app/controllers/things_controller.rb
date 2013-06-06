class ThingsController < ApplicationController
  before_filter :authenticate_user!

  def new; end

  def create
    if current_user.company.things << thing
      redirect_to root_path
    else
      render :new
    end
  end

protected
  def thing
    @thing ||= current_user.things.build(thing_params)
  end
  helper_method :thing

  def thing_params
    if params[:thing].present?
      params.require(:thing).permit(:url, :description)
    else
      {}
    end
  end
end