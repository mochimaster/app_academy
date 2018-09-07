class User < ApplicationRecord
  
  has_many :enrollment,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :Enrollment 
  
  
  has_many :enrolled_courses,
  through: :enrollment,
  source: :course
  
  has_many :course_teached,
  primary_key: :id,
  foreign_key: :instructor_id,
  class_name: :Course
  
end


# 

# SELECT 
#   courses.name
# FROM
#   users
# JOIN enrollments ON users.id = enrollments.student_id
# JOIN courses ON courses.id = enrollments.course_id
# WHERE 
# 
# 
#   users.name = 'CJ'
#   OR
#   users.id = 1
# 