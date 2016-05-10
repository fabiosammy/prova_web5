class Person < ActiveRecord::Base
	has_many :phones
	has_many :friends

	validates :name, :username, :status, presence: true
  validates_format_of :username, :with => /\A[a-z0-9]+\z/
  validates_inclusion_of  :status, :in => ["online", "offline", "busy", "hide"]
end
