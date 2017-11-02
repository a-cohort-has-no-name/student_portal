class EducationsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @educations = Education.all
  end

  def create
    @education = Education.create(
      student_id: current_user.id,
      university_name: params[:university_name],
      degree: params[:degree],
      start_date: params[:start_date],
      end_date: params[:end_date],
      details: params[:details],
      )
    redirect_to "/students/#{:student_id}/educations"
  end

  def update
    
  end

  def delete
    
  end

end

# REFERENCE:

# def index
#   @employees = Employee.all
# end

# def show
#   @employee = Employee.find(params[:id])
# end

# def new
  
# end

# def create
#   @employee = Employee.create(params[:first_name], params[:last_name], params[:email])
#   redirect_to "/employees/#{@employee.id}"
# end

# def edit
#   @employee = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body
# end

# def update
#   @employee = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body
#   Unirest.patch("#{ENV['API_URL']}/#{@employee['id']}", headers: {"Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
#   redirect_to "/employees/#{@employee['id']}"
# end

# def destroy
#   employee = Employee.find(params[:id])
#   employee.destroy
#   redirect_to '/employees'
# end