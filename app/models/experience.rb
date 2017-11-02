class Experience

  attr_accessor :experience_id, :start_date, :end_date, :job_title, :company_name, :details, :student_id

  def initialize(options_hash)
    @experience_id = options_hash['id']
    @start_date = options_hash['start_date']
    @end_date = options_hash['end_date']
    @job_title = options_hash['job_title']
    @company_name = options_hash['company_name']
    @details = options_hash['details']
    @student_id = options_hash['student_id']
  end

  def self.find(id)
    experience = Unirest.get("https://macabre-asylum-90626.herokuapp.com/experiences/#{id}", headers: {"Accept" => "application/json"}).body
    Experience.new(experience)
  end

  def self.all
    experiences = []
    api_experiences = Unirest.get("https://macabre-asylum-90626.herokuapp.com/experiences", headers: {"Accept" => "application/json"}).body
    api_experiences.each do |api_experience|
      if api_experience['student_id'] == params[:student_id]
        experiences << Experience.new(api_experience)
      end
    end
    experiences
  end

  def self.create(start_date, end_date, job_title, company_name, details, student_id)
    skill = Unirest.post("https://macabre-asylum-90626.herokuapp.com/experience", headers: {"Accept" => "application/json"}, parameters: {start_date: start_date, end_date: end_date, datetime: datetime, job_title: job_title, company_name: company_name, details: details, student_id: student_id}).body
  end

  def destroy
    Unirest.delete("https://macabre-asylum-90626.herokuapp.com/experiences/#{id}")
end