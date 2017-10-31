class StudentsController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body # TO DO: check if url is correct
  end

  def update
    @student = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body
    Unirest.patch("#{ENV['API_URL']}/#{@student['id']}", headers: {"Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_EMAIL']}"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], linkedin_url: params[:linkedin_url], twitter_handle: params[:twitter_handle], personal_website: params[:personal_website], resume_url: params[:resume_url], github_url: params[:github_url], photo: params[:photo], password_digest: Password.create(params[:password])}).body # TO DO: insert other parameters
    redirect_to "/students/#{@student['id']}"
  end

end
