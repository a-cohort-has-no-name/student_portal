class SkillsController < ApplicationController

  before_action :authenticate_user!

  def show
    @skill = Skill.find(params[:skill_id])
  end

  def create
    @skill = Skill.create(params[:skill_name], params[:student_id])
    redirect_to "/students/#{:student_id}/skills"
  end

  def update
    @skill = Unirest.get("https://macabre-asylum-90626.herokuapp.com/skill/#{params[:skill_id]}").body
    Unirest.patch("https://macabre-asylum-90626.herokuapp.com/skills/#{@skill['skill_id']}", headers: {"Accept" => "application/json"}, parameters: {skill_name: params[:skill_name]}).body # TO DO: insert other parameters
  end

  def destroy
    skill = Skill.find(params[:skill_id])
    skill.destroy
    redirect_to "/students/#{:student_id}/skills"
  end

end
