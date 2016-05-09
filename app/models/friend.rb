class Friend < ActiveRecord::Base
  belongs_to :person
  has_many :contacts
end
