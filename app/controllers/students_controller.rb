class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body # TO DO: check 
  end

  def update
    @student = Unirest.get("#{ENV['API_URL']}/#{params[:id]}").body
    Unirest.patch("#{ENV['API_URL']}/#{@student['id']}", headers: {"Accept" => "application/json"}, parameters: {first_name:params[:first_name], }).body # TO DO: insert other parameters
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to "/"
  end


end
