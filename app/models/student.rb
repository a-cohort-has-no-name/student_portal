class Student

  attr_accessor :id, :first_name, :last_name, :email, :phone_number, :bio, :linkedin_url, :twitter_handle, :personal_website, :resume_url, :github_url, :photo, :password_digest

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
    @first_name = options_hash[:first_name]
    @last_name = options_hash[:last_name]
    @email = options_hash[:email]
    @phone_number = options_hash[:phone_number]
    @bio = options_hash[:bio]
    @linkedin_url = options_hash[:linkedin_url]
    @twitter_handle = options_hash[:twitter_handle]
    @personal_website = options_hash[:personal_website]
    @resume_url = options_hash[:resume_url]
    @github_url = options_hash[:github_url]
    @photo = options_hash[:photo]
    @password_digest = options_hash[:password_digest]
  end

  def self.find(id)
    student = Unirest.get("#{ENV['API_URL']}/#{id}").body
    Student.new(student)
  end

  def self.all
    students = []

    #TEST FAKE DATA
    api_students = [{first_name: "bob", last_name: "bob", email: "bob@b.com", phone_number: 1, bio: "test", linkedin_url: "1.com", twitter_handle: "test1", personal_website: "2.com", resume_url: "3.com", github_url: "4.com", photo: "url?", password_digest: "$2a$10$LTdguNuefm2yVpYhU53qHu3LQ.I88YANtf5VH3AyjisYTmwxFk.9a"}, {first_name: "jim", last_name: "jim", email: "jim@b.com", phone_number: 2, bio: "test2", linkedin_url: "a.com", twitter_handle: "test2", personal_website: "b.com", resume_url: "c.com", github_url: "d.com", photo: "url?", password_digest: "$2a$10$zdSe.tqCOXZ4vIqa/Tlp/./XLhYDF0Vnk0EIb/6YqOMAlmFZngbpe"}]
    #TEST FAKE DATA

    #api_students = Unirest.get("#{ENV['API_URL']}", headers: {"Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_EMAIL']}"}).body
    api_students.each do |api_student|
      students << Student.new(api_student)
    end
    students
  end
end