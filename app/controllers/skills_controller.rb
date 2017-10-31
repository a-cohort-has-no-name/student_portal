class SkillsController < ApplicationController

  before_action :authenticate_user!

  def show
    @skill = current_user.skills.find(params[:id])
  end

  def edit
    @skill = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body # TO DO: check if url is correct
  end

  def update
    @skill = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body
    Unirest.patch("#{ENV['API_URL']}/#{@student['id']}", headers: {"Accept" => "application/json"}, parameters: {first_name:params[:first_name], }).body # TO DO: insert other parameters
  end

  def destroy
    skill = current_user.skills.find(params[:id])
    skill.destroy
    redirect_to "/"
  end

end
