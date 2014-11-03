class Pokemon < ActiveRecord::Base
	belongs_to :trainer
	validates :name, uniqueness: true, presence: true
end