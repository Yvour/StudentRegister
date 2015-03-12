class Student < ActiveRecord::Base
  belongs_to :first_name
  belongs_to :last_name
  belongs_to :student_group
  has_many :grades
  
  validates_presence_of :first_name, :last_name, :student_group
  validates_uniqueness_of :email
  validates :first_name_value, :last_name_value, :email, :birthdate, :registration_time, :registration_ip,
   { 
                                allow_blank: false,
                                allow_nil: false,
                                presence: true
                                }
# Группы проверяются отдельно.                          
  
  
  def to_label
    "#{first_name_value} #{last_name_value}"
  end
  
  before_validation :set_name_id


    def set_name_id
      puts "setting"
      name = FirstName.where(name: self.first_name_value).first;
      name = FirstName.create(name: self.first_name_value) if name.nil?
      self.first_name = name
      name = LastName.where(name: self.last_name_value).first;
      name = LastName.create(name: self.last_name_value) if name.nil?
      self.last_name = name
      
    end

  
end
