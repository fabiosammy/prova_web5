class Phone < ActiveRecord::Base
  	#default não setado = false
	validates :number, presence: true
	validates_format_of :number, :with => /\A\+55\(\d{3}\)\s\d{5}\-\d{4}\z/
	belongs_to :person
end

