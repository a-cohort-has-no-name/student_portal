class ExperiencesController < ApplicationController

  before_action :authenticate_user!
  def show
    @experience = Experience.find(params[:id])
  end

  def create
    @experience = Experience.create(params[:skill_name], params[:student_id])
    redirect_to "/students/#{:student_id}/experiences"
  end

  def edit
    @experience = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body # TO DO: check if url is correct
  end

  def update
    @experience = Unirest.get("#{ENV['API_URL']}/experience/#{params[:id]}").body
    Unirest.patch("#{ENV['API_URL']}/skill/#{@skill['skill_id']}", headers: {"Accept" => "application/json"}, parameters: {skill_name: params[:skill_name]}).body # TO DO: insert other parameters
  end

  def destroy
    skill = Experience.find(params[:id])
    skill.destroy
    redirect_to "/students/#{:student_id}/skills"
  end

end
