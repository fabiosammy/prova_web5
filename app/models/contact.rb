class Contact < ActiveRecord::Base

  #validates_format_of :value, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :value, presence: true


  validates_inclusion_of  :type_, :in => [ "email", "phone", "address"]

  belongs_to :friend
end
