class CoursesTrip < ApplicationRecord
  belongs_to :course
  belongs_to :trip
end
