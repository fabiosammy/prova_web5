class Person < ActiveRecord::Base
	include ActiveModel::Validations

	validates_presence_of :name, :status
	validates_inclusion_of :status, in: %w( online offline busy hide ), message: "status %{value} is not included in the list"

  	has_many :phones
	has_many :friends
end
