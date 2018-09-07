# == Schema Information
#
# Table name: users
#
#  id       :bigint(8)        not null, primary key
#  username :string           not null
#

class User < ApplicationRecord
  has_many :polls,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Poll
  
end
