class Friend < ActiveRecord::Base
	validates_presence_of :name

  belongs_to :person
  has_many :contacts
end
