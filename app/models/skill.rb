class Skill

  attr_accessor :skill_id, :skill_name, :student_id

  def initialize(options_hash)
    # @first_name = options_hash['first_name']
    # @last_name = options_hash['last_name']
    # @email = options_hash['email']
    # @phone_number = options_hash['phone_number']
    # @bio = options_hash['bio']
    # @linkedin_url = options_hash['linkedin_url']
    # @twitter_handle = options_hash['twitter_handle']
    # @personal_website = options_hash['personal_website']
    # @resume_url = options_hash['resume_url']
    # @github_url = options_hash['github_url']
    # @photo = options_hash['photo']
    # @password_digest = options_hash['password_digest']
#test
    @skill_id = options_hash['skill_id']
    @skill_name = options_hash['skill_name']
    @student_id = options_hash['student_id']
  end

  def self.find(id)
    student = Unirest.get("https://macabre-asylum-90626.herokuapp.com/skills/#{id}", headers: {"Accept" => "application/json"}).body
    Skill.new(skill)
  end

  def self.all
    skills = []
    api_skills = Unirest.get("https://macabre-asylum-90626.herokuapp.com/skills", headers: {"Accept" => "application/json"}).body
    api_skills.each do |api_skill|
      if api_skill['student_id'] == params[:student_id]
        skills << Skill.new(api_skill)
      end
    end
    skills
  end

  def self.create(skill_name, student_id)
    skill = Unirest.post("https://macabre-asylum-90626.herokuapp.com/skills", headers: {"Accept" => "application/json"}, parameters: {skill_name: skill_name, student_id: student_id}).body
  end

  def destroy
    Unirest.delete("https://macabre-asylum-90626.herokuapp.com/skills/#{params[:skill_id]}")
end