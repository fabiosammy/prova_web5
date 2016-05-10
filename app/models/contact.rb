class Contact < ActiveRecord::Base
  belongs_to :friend
  validates_inclusion_of :type_contact, in: %w( email phone address ), message: "type %{value} is not included in the list"
end
