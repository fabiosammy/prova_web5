class Phone < ActiveRecord::Base
	belongs_to :person

	validates :number, presence: true
	validates_format_of :number, :with => /\A\+55\(\d{3}\)\s\d{5}\-\d{4}\z/
end
