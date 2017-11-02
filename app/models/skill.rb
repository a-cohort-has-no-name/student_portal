class Skill

  attr_accessor :skill_id, :skill_name, :student_id

  def initialize(options_hash)
    @skill_id = options_hash['id']
    @skill_name = options_hash['skill_name']
    @student_id = options_hash['student_id']
  end

  def self.find(id)
    skill = Unirest.get("https://macabre-asylum-90626.herokuapp.com/skills/"+id.to_s, headers: {"Accept" => "application/json"}).body
    Skill.new(skill)
  end

  def self.all(student_id)
    skills = []
    api_skills = Unirest.get("https://macabre-asylum-90626.herokuapp.com/skills/", headers: {"Accept" => "application/json"}).body
    api_skills.each do |api_skill|
      if api_skill['student_id'] == student_id
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
end