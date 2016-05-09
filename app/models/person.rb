class Person < ActiveRecord::Base
  has_many :phones
  has_many :friends

  validates :status, presence: true
  validates_inclusion_of :status, in: %w( online offline busy hide )

end
