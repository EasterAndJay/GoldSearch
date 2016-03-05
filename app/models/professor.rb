class Professor < ActiveRecord::Base

validates :dept, presence: true
validates :name, presence: true

has_many :courses

end
