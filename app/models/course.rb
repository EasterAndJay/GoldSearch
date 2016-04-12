class Course < ActiveRecord::Base

  validates :number, presence: true
  validates :title, presence: true
  validates :dept, presence: true
  validates :year, presence: true
  validates :quarter, presence: true

  has_many :sections
  belongs_to :professor


  def name
    "#{self.dept} #{self.number} - #{self.title.titleize}"
  end

  def name_changed?
    dept_changed? || number_changed? || title_changed?
  end

  def to_s
    "#{self.dept} #{self.number} - #{self.title} #{self.quarter} #{self.year}"
  end

end
