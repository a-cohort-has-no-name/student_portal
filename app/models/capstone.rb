class Capstone

  attr_accessor :capstone_id, :student_id, :capstone_name, :description, :capstone_url, :screenshot

  def initialize(options_hash)
    @capstone_id = options_hash['id']
    @student_id = options_hash['student_id']
    @capstone_name = options_hash['capstone_name']
    @description = options_hash['description']
    @capstone_url = options_hash['capstone_url']
    @screenshot = options_hash['screenshot']
  end

  def self.find(id)
    capstone = Unirest.get("https://macabre-asylum-90626.herokuapp.com/students", headers: {"Accept" => "application/json"}).body
    Capstone.new(capstone)
  end

  def self.all
    capstones = []
    api_capstones = Unirest.get("https://macabre-asylum-90626.herokuapp.com/students", headers: {"Accept" => "application/json"}).body
    api_capstones.each do |api_capstone|
      if api_capstone['student_id'] == params[:student_id]
        capstones << Capstone.new(api_capstone)
      end
    end
    capstones
  end

  def self.create(student_id, capstone_name, description, capstone_url, screenshot)
    capstone = Unirest.post("https://macabre-asylum-90626.herokuapp.com/students", headers: {"Accept" => "application/json"}, parameters: {
      student_id: student_id,
      capstone_name: capstone_name, 
      description: description,
      capstone_url: capstone_url,
      screenshot: screenshot
      }).body
  end

  def destroy
    Unirest.delete("https://macabre-asylum-90626.herokuapp.com/students")
  end
  
end