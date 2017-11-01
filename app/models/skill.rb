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
    @skill_id = options_hash[:skill_id].to_i
    @skill_name = options_hash[:skill_name]
    @student_id = options_hash[:student_id].to_i
  end

  def self.find(id)
    #student = Unirest.get("#{ENV['API_URL']}/#{id}", headers: {"Accept" => "application/json"}).body
    skill = {skill_id: 1, skill_name: "test skill", student_id: 1}
    Skill.new(skill)
  end

  def self.all
    skills = []

    #TEST FAKE DATA
    api_skills = [{skill_id: 1, skill_name: "test skill", student_id: 1}, {skill_id: 2, skill_name: "test skill2", student_id: 1}]
    #TEST FAKE DATA

    #api_skills = Unirest.get("#{ENV['API_URL']}", headers: {"Accept" => "application/json"}).body
    api_skills.each do |api_skill|
      skills << Skill.new(api_skill)
    end
    skills
  end

  def self.create(skill_name, student_id)
    skill = Unirest.post("#{ENV['API_URL']}", headers: {"Accept" => "application/json"}, parameters: {skill_name: skill_name, student_id: student_id}).body
  end

  def destroy
    Unirest.delete("#{ENV['API_URL']}/skill/#{id}")
end