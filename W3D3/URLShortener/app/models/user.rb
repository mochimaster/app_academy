# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validate : must_have_alias

    def must_have_alias
      unless email.include?("@")
        errors[:email] << "use @ symbol"
      end
    end


end
