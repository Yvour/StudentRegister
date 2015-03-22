class LastName < ActiveRecord::Base
  has_many :students
  has_and_belongs_to_many :last_name_suffixes
 before_validation :generate_suffixes
  
  def generate_suffixes
    if self.last_name_suffixes.empty?
      

    self.name.split('').each_with_index{
      |value, index|
       self.last_name_suffixes << LastNameSuffix.find_or_initialize_by(name:self.name[-1-index..-1])
       }
     end
  end
  
end
