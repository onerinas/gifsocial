# == Schema Information
#
# Table name: moments
#
#  id         :bigint           not null, primary key
#  gif_url    :string
#  wassup     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Moment < ApplicationRecord
  validates :gif_url, presence: true
  validates :wassup, length: { maximum: 100 }
end
