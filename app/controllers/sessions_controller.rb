class SessionsController < ApplicationController

  def create
    user = Student.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:student_id] = user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to '/students/#{current_user.id}'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/'
  end

end
