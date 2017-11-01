class ExperiencesController < ApplicationController

  before_action :authenticate_user!
  
  def show
    @experience = Experience.find(params[:experience_id])
  end

  def create
    @experience = Experience.create(params[:skill_name], params[:student_id])
    redirect_to "/students/#{:student_id}/experiences"
  end

  def update
    @experience = Unirest.get("https://macabre-asylum-90626.herokuapp.com/experiences/#{params[:experience_id]}").body
    Unirest.patch("https://macabre-asylum-90626.herokuapp.com/experiences/#{params[:experience_id]}", headers: {"Accept" => "application/json"}, parameters: {skill_name: params[:skill_name]}).body # TO DO: insert other parameters
  end

  def destroy
    experience = Experience.find(params[:experience_id])
    experience.destroy
    redirect_to "/students/#{:student_id}/experiences"
  end

end
