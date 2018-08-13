class Event < ApplicationRecord

	validates :name, presence: true
	validates :category_id, numericality: { greater_than: 0 }
	validates :place, presence: true
	validates :address, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	
	belongs_to :user
	belongs_to :category
end
