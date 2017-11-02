class EducationsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @educations = Education.all
  end

  def create
    @education = Education.create(
      current_user.id,
      params[:university_name],
      params[:degree],
      params[:start_date],
      params[:end_date],
      params[:details],
      )
    redirect_to "/students/#{:student_id}"
  end

  def update
    @education = Unirest.get("").body
    Unirest.patch("", headers: {"Accept" => "application/json"}, parameters: {
      university_name: params[:university_name],
      degree: params[:degree],
      start_date: params[:start_date],
      end_date: params[:end_date],
      details: params[:details],
      }).body
  end

  def delete
    education = Education.find(params[:education_id])
    education.destroy
    redirect_to "/students/#{:student_id}"
  end

end