class Person < ActiveRecord::Base
	include ActiveModel::Validations

	validates_presence_of :name, :status
	validates_inclusion_of :status, in: %w( online offline busy hide ), message: "status %{value} is not included in the list"

  validates :username, format: { with: /\A[a-zA-Z0-9][a-z0-9_\-]*\z/i , message: "Não Aceita Caracteres não Alfanúmericos" }

  before_save { self.username = username.downcase }

  has_many :phones
	has_many :friends
end
