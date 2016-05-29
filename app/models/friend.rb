class Friend < ActiveRecord::Base
  belongs_to :person
  has_many :contacts

  validates_presence_of :name, message: "-> Não Pode Ser Vazio"
end
