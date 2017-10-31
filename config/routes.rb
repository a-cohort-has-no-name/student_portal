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

#Experience
    get "/students/:student_id/experiences" => "experiences#index"
    post "/students/:student_id/experiences" => "experiences#create"
    get "/students/:student_id/experiences/:experience_id" => "experiences#edit"
    patch "/students/:student_id/experiences/:experience_id" => "experiences#update"
    delete "/students/:student_id/experiences/:experience_id" => "experiences#destroy"

#Skills
    get "/students/:student_id/skills" => "skills#index"
    post "/students/:student_id/skills" => "skills#create"
    get "/students/:student_id/skills/:skill_id" => "skills#edit"
    patch "/students/:student_id/skills/:skill_id" => "skills#update"
    delete "/students/:student_id/skills/:skill_id" => "skills#destroy"

#Education
    get "/students/:student_id/educations" => "educations#index" 
    post "/students/:student_id/educations" => "educations#create"
    get "/students/:student_id/educations/:education_id" => "educations#edit"
    patch "/students/:student_id/educations/:education_id" => "educations#update"
    delete "/students/:student_id/educations/:education_id" => "educations#destroy"

#Capstone
    get "/students/:student_id/capstones" => "capstones#index"
    post "/students/:student_id/capstones" => "capstones#create"
    get "/students/:student_id/capstones/:capstone_id" => "capstones#edit"
    patch "/students/:student_id/capstones/:capstone_id" => "capstones#update"
    delete "/students/:student_id/capstones/:capstone_id" => "capstones#destroy"

end
