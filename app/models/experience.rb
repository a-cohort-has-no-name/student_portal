class Experience

  attr_accessor :id, :start_date, :end_date, :job_title, :company_name, :details, :student_id

  def initialize(options_hash)
    @experience_id = options_hash[:id].to_i
    @start_date = options_hash[:start_date]
    @end_date = options_hash[:end_date]
    @job_title = options_hash[:job_title]
    @company_name = options_hash[:company_name]
    @details = options_hash[:details]
    @student_id = options_hash[:student_id].to_i
  end

  def self.find(id)
    #student = Unirest.get("#{ENV['API_URL']}/#{id}", headers: {"Accept" => "application/json"}).body
    Experience.new(experience)
  end

  def self.all
    experiences = []

    #api_experiences = Unirest.get("#{ENV['API_URL']}", headers: {"Accept" => "application/json"}).body
    api_experiences.each do |api_experience|
      experiences << Experience.new(api_experience)
    end
    experiences
  end

  def self.create(skill_name, student_id)
    skill = Unirest.post("https://macabre-asylum-90626.herokuapp.com/experience", headers: {"Accept" => "application/json"}, parameters: {skill_name: skill_name, student_id: student_id}).body
  end

  def destroy
    Unirest.delete("#{ENV['API_URL']}/skill/#{id}")
end