ThinkingSphinx::Index.define :course, :with => :active_record do
  indexes title
  indexes dept
  indexes number
  indexes area
  indexes ethn
  indexes euro
  indexes quant
  indexes world
  indexes writ
  indexes desc
end