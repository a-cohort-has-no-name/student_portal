class Student

  attr_accessor :id, :first_name, :last_name, :email, :phone_number, :bio, :linkedin_url, :twitter_handle, :personal_website, :resume_url, :github_url, :photo, :password

  def initialize(options_hash)
    @id = options_hash['id']
    @first_name = options_hash['first_name']
    @last_name = options_hash['last_name']
    @email = options_hash['email']
    @phone_number = options_hash['phone_number']
    @bio = options_hash['bio']
    @linkedin_url = options_hash['linkedin_url']
    @twitter_handle = options_hash['twitter_handle']
    @personal_website = options_hash['personal_website']
    @resume_url = options_hash['resume_url']
    @github_url = options_hash['github_url']
    @photo = options_hash['photo']
    @password_digest = options_hash['password']
  end

  def self.find(id)
    student = Unirest.get("https://macabre-asylum-90626.herokuapp.com/students/#{id}", headers: {"Accept" => "application/json"}).body
    Student.new(student)
  end

  def self.all
    students = []

    api_students = Unirest.get("https://macabre-asylum-90626.herokuapp.com/students", headers: {"Accept" => "application/json"}).body
    api_students.each do |api_student|
      students << Student.new(api_student)
    end
    students
  end
end