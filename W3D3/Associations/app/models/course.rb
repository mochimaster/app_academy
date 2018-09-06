class Course < ApplicationRecord
  
  has_many :enrollment,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :Enrollment
  
  has_many :users_and_students, 
  through: :enrollment,
  source: :user
  
  belongs_to :prereq, 
  primary_key: :id,
  foreign_key: :prereq_id,
  optional: true,
  class_name: :Course
  
  has_many :postreq, 
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: :Course
  
  
  
  belongs_to :instructor,
  primary_key: :id,
  foreign_key: :instructor_id,
  class_name: :User
  
end


# SELECT * FROM course
# WHERE prereq_id NOT NULL