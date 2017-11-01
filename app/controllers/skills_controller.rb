class SkillsController < ApplicationController

  before_action :authenticate_user!

  def show
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = Skill.create(params[:skill_name], params[:student_id])
    redirect_to "/students/#{:student_id}/skills"
  end

  def edit
    @skill = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body # TO DO: check if url is correct
  end

  def update
    @skill = Unirest.get("#{ENV['API_URL']}/skill/#{params[:id]}").body
    Unirest.patch("#{ENV['API_URL']}/skill/#{@skill['skill_id']}", headers: {"Accept" => "application/json"}, parameters: {skill_name: params[:skill_name]}).body # TO DO: insert other parameters
  end

  def destroy
    skill = Skill.find(params[:id])
    skill.destroy
    redirect_to "/students/#{:student_id}/skills"
  end

end
