Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#sessions
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    get "/logout" => "sessions#destroy"
#students
    get "/students/:student_id" => "students#show"
    get "/students/:student_id/edit" => "students#edit"
    patch "/students/:student_id" => "students#update"
    delete "/students/:student_id" => "students#destroy"

#Experience
    post "/students/:student_id/experiences" => "experiences#create"
    get "/students/:student_id/:experience_id" => "experiences#edit"
    patch "/students/:student_id/:experience_id" => "experiences#update"
    delete "/students/:student_id/:experience_id" => "experiences#destroy"

#Skills
    post "/students/:student_id/skills" => "skills#create"
    get "/students/:student_id/:skill_id" => "skills#edit"
    patch "/students/:student_id/:skill_id" => "skills#update"
    delete "/students/:student_id/:skill_id" => "skills#destroy"

#Education
    post "/students/:student_id/educations" => "educations#create"
    get "/students/:student_id/:education_id" => "educations#edit"
    patch "/students/:student_id/:education_id" => "educations#update"
    delete "/students/:student_id/:education_id" => "educations#destroy"

#Capstone
    post "/students/:student_id/capstones" => "capstones#create"
    get "/students/:student_id/:capstone_id" => "capstones#edit"
    patch "/students/:student_id/:capstone_id" => "capstones#update"
    delete "/students/:student_id/:capstone_id" => "capstones#destroy"

end
