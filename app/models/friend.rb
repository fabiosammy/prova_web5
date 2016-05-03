class Friend < ActiveRecord::Base

	validates :name, presence: true

	belongs_to :person
	has_many :contacts
end
