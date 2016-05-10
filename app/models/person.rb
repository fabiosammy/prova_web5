class Person < ActiveRecord::Base
  has_many :phones
  has_many :friends
  
  validates :status, presence: true
  validates_inclusion_of :status, in: %w( online offline busy hide )
  validates_format_of :username, :with => /\A[a-z0-9]+\z/
  validates :username, presence: true
  validates :name, presence: true
end
