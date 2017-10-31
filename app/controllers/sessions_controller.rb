class SessionsController < ApplicationController

  def create
    # user = Student.find_by(email: params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:student_id] = user.id
    #   flash[:success] = 'Successfully logged in!'
    #   redirect_to '/students/#{current_user.id}'
    # else
    #   flash[:warning] = 'Invalid email or password!'
    #   redirect_to '/login'
    # end
    students = Student.all
    students.each do |student|
      if student.email == params[:email]
        if BCrypt::Password.new(student.password_digest) == params[:password]
          session[:student_id] = student.id
          flash[:success] = 'Successfully Logged In!'
          redirect_to "/students/#{student.id}"
          break
        else
          flash[:warning] = 'Incorrect Password'
          render :new
        end
      end
    end
    flash[:warning] = 'Email not found'
    render :new
  end

  def destroy
    session[:student_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end

end
