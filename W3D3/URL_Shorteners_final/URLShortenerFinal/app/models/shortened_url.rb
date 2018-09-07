# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :text             not null
#  user_id    :integer          not null
#  short_url  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  
  belongs_to :shorten
  primary_key: :id
  foreign_key: :short_url
  class_name: :ShortenedUrl
  
  
  
  
end
