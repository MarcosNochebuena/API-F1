# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  base       :string
#  country    :string
#  engine     :string
#  founded    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :drivers
  has_one :team_principal
  has_many :results

  validates :name, :base, :country, :engine, :founded, presence: true
end
