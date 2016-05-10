class Phone < ActiveRecord::Base
  belongs_to :person
  validates :number, presence: true
  validates :default, presence: true
  
end
