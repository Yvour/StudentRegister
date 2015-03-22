class Student < ActiveRecord::Base
  belongs_to :first_name
  belongs_to :last_name
  belongs_to :student_group
  has_many :grades
  
  validates_presence_of :first_name, :last_name, :student_group
  validates_uniqueness_of :email
  validates :first_name_value, :last_name_value, :email, :birthdate, :registration_time, :registration_ip,
   { 
                                presence: true
                                }
# Группы проверяются отдельно.                          
  
  
  def to_label
    "#{first_name_value} #{last_name_value}"
  end
  
  before_validation :set_name_id


    def set_name_id
      puts "setting " + self.first_name_value + ' ' + self.last_name_value
      name = FirstName.find_or_create_by(name: self.first_name_value);

      self.first_name = name
      name = LastName.find_or_create_by(name: self.last_name_value);

      self.last_name = name
      
    end

  
end
