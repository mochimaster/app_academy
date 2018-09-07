# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  question   :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :polls,
  primary_key: :id,
  foreign_key: :poll_id, #question_id
  class_name: :Poll
  
  # has_many :answerchoices
  
end
