class Contact < ActiveRecord::Base
  belongs_to :friend
  
  validates :value, presence: true
  validates_inclusion_of  :type_, :in => [ "email", "phone", "address"]
end
