class Person < ActiveRecord::Base
  has_many :phones
  has_many :friends


  validates :status, presence: true

end
