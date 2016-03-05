class Course < ActiveRecord::Base

  validates :number, presence: true
  validates :title, presence: true
  validates :dept, presence: true
  validates :year, presence: true
  validates :quarter, presence: true

  has_many :sections
  belongs_to :professor

  fuzzily_searchable :name

  def name
    "#{self.dept} #{self.number} - #{self.title.titleize}"
  end

  def name_changed?
    dept.changed? || number.changed? || title.changed?
  end

  def to_s
    "#{self.dept} #{self.number} - #{self.title} #{self.quarter} #{self.year}"
  end

end
