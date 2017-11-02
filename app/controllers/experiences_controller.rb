class ExperiencesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @experiences = Experience.all
  end

  def create
    @experience = Experience.create(
      current_user.id,
      params[:start_date],
      params[:end_date],
      params[:job_title],
      params[:company_name],
      params[:details]
      )
    redirect_to "/students/#{:student_id}/experiences"
  end

  def update
    @experience = Unirest.get("https://macabre-asylum-90626.herokuapp.com/experiences/#{params[:experience_id]}").body
    Unirest.patch("https://macabre-asylum-90626.herokuapp.com/experiences/#{params[:experience_id]}", headers: {"Accept" => "application/json"}, parameters: {
      start_date: params[:start_date],
      end_date: params[:end_date],
      job_title: params[:job_title],
      company_name: params[:company_name],
      details: params[:details]
      }).body # TO DO: insert other parameters
  end

  def destroy
    experience = Experience.find(params[:experience_id])
    experience.destroy
    redirect_to "/students/#{:student_id}/experiences"
  end
end
