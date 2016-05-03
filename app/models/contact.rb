class Contact < ActiveRecord::Base
  belongs_to :friend

  validates_inclusion_of :tipo, in: %w(email phone address ), message: "-> Não Consta Na Lista"
  
end
