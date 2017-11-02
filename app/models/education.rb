class Education

  attr_accessor :education_id, :student_id, :university_name, :degree, :start_date, :end_date, :details

  def initialize(options_hash)
    @education_id = options_hash['id']
    @student_id = options_hash['student_id']
    @capstone_name = options_hash['capstone_name']
    @description = options_hash['description']
    @capstone_url = options_hash['capstone_url']
    @screenshot = options_hash['screenshot']
  end

  def self.find(id)
    education = Unirest.get("https://macabre-asylum-90626.herokuapp.com/students", headers: {"Accept" => "application/json"}).body
    Education.new(capstone)
  end

  def self.all
    educations = []
    api_educations = Unirest.get("https://macabre-asylum-90626.herokuapp.com/students", headers: {"Accept" => "application/json"}).body
    api_educations.each do |api_education|
      if api_education['student_id'] == params[:student_id]
        educations << Education.new(api_education)
      end
    end
    educations
  end

  def self.create(student_id, capstone_name, description, capstone_url, screenshot)
    education = Unirest.post("https://macabre-asylum-90626.herokuapp.com/students", headers: {"Accept" => "application/json"}, parameters: {
      student_id: student_id,
      university_name: university_name,
      degree: degree,
      start_date: start_date,
      end_date: end_date,
      details: details
      }).body
  end

  def destroy
    Unirest.delete("https://macabre-asylum-90626.herokuapp.com/students")
  end
  
end