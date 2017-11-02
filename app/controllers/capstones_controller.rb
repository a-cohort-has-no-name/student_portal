class CapstonesController < ApplicationController

  before_action :authenticate_user!

  def index
    @capstones = Capstone.all
  end

  def create
    @capstone = Capstone.create(
      current_user.id,
      params[:capstone_name],
      params[:description],
      params[:capstone_url],
      params[:screenshot]
      )
    redirect_to "/students/#{:student_id}"
  end

  def update
    @capstone = Unirest.get("").body
    Unirest.patch("", headers: {"Accept" => "application/json"}, parameters: {
      capstone_name: params[:capstone_name],
      description: params[:description],
      capstone_url: params[:capstone_url],
      screenshot: params[:screenshot]
      }).body
  end

  def delete
    capstone = Capstone.find(params[:capstone_id])
    capstone.destroy
    redirect_to "/students/#{:student_id}"
  end
  
end
