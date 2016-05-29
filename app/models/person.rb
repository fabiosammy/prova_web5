class Person < ActiveRecord::Base
	has_many :phones
	has_many :friends

	validates_presence_of :name, message: "-> Não Pode Ser Vazio"
	# validates_uniqueness_of :username, :case_sensitive => true, message: "Não deve conter Letras Maiusculas"
	
	validates :username, format: { with: /\A[a-zA-Z0-9][a-z0-9_\-]*\z/i ,
    message: "Não Aceita Caracteres não Alfanúmericos" }
    
    before_save { self.username = username.downcase }
	validates_inclusion_of :status, in: %w(online offline busy hide ), message: "-> Não Consta Na Lista"
    
end
