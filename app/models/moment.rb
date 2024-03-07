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

  def self.search_gif(wassup)
    return [] if wassup.blank?

    wassup.squish!

    response = HTTParty.get("https://tenor.googleapis.com/v2/search?q=#{wassup}&key=#{Rails.application.credentials.tenor_api_key}&limit=9")

    response["results"].map do |result|
      {
        tinygif: result["media_formats"]["tinygif"]["url"],
        gif: result["media_formats"]["gif"]["url"]
      }
    end
  end
end
